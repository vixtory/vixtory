class ProjectController {

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']
    
       static authorizations = [
        add: Role.LOGGEDIN_ROLES,
        delete: Role.LOGGEDIN_ROLES,
        edit: Role.LOGGEDIN_ROLES,
        index: Role.LOGGEDIN_ROLES,
        list: Role.LOGGEDIN_ROLES,
        listclosed: Role.LOGGEDIN_ROLES,
        login: Role.LOGGEDIN_ROLES,
        save: Role.LOGGEDIN_ROLES,
        show: Role.LOGGEDIN_ROLES,
        update: Role.LOGGEDIN_ROLES
    ]

    def authenticateService
    def breadcrumbService

    def index = { redirect(action:list,params:params) }


    def login = {
    		def breadcrumb = "${message(code:'login.login')}"
    		['breadcrumb': breadcrumb]
    }


    //returns all projects or those that are chosen, ordered by name
    def list = {
        def res
        def chosen
        def status = params.status
        def c = Project.createCriteria()
        if (!status || status == 'open'){
               res = c {
                  eq('status', WorkStatus.IN_PROGRESS)
                  order("name", "asc")
              }
            }
        else{
                res = c {
                    eq('status', WorkStatus.CLOSED)
                    order("name", "asc")
                }
            }
        def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,null,null)
        [projects: res, status: status, 'breadcrumb': breadcrumb]
    }
    
    def listclosed = {
        
    }

    /**
     * Fetch newes version for requested project and show it
     */
    def show = {
    	def project = Project.get(params.id)
    	def versions = project.versions
    	
    	// If version(s) found
    	if(versions) {
	    	def previousVersion = null
	    	def newestVersion = null
	    	
	    	// Find the latest version
	    	for(version in versions) {
	    		if(version.versionNumber > previousVersion)
	    			newestVersion = version
	    	}
	    	
	    	// Redirect into latest version's view
	    	redirect(controller:"version",action:"show",params:[id:newestVersion.id])
	     }
    	// Else redirect to new version form
		else {
			redirect(controller:"version",action:"add",params:[projectId: params.id])
		}
    }

    def delete = {
    	def project = Project.get(params.id)
        if(project) {
            project.delete()
            def r =message(code:"project.nameDeleted", args:[project.name])
            render "$r"
        }
        else {
            def r =message(code:"project.idNotFound", args:[params.id])
            render "$r"
        }
    }

    def edit = {
        def project = Project.get(params.id)

        if(!project) {
        	def m=message(code:'project.idNotFound', args:[params.id])
            flash.message = "$m"
            redirect(action:list)
        }
        else {
			def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,params.action,project)
		    def users = User.findAll()
		    def selectedManagers = project.managers*.getProperty('id')
        	return ["project":project,"users": users,"selectedManagers": selectedManagers,"breadcrumb":breadcrumb]
        }
    }

    def update = {
        def project = Project.get(params.id)
        if (project) {

        	// if the status is set to Closed,
            // fetches all projects versions and closes them
        	if (params.status == "Closed") {
            	def versions = project.versions
				if(versions) {
		    		for(version in versions) {
	    				if(version.status == WorkStatus.IN_PROGRESS) {
	    					version.status = WorkStatus.CLOSED
	               			version.save()
	    				}
		    		}
		    	}
        	}

            // we old name of the project, so that it can be used in the navigation link
            // if the name is empty
            def oldName = project.name
                                
            project.properties = params

            if (params.managers) {
                def userCriteria = User.createCriteria();
                def managerIds = (params.managers instanceof String)?
                    [Long.parseLong(params.managers)]:params.managers.collect{Long.parseLong(it)}

                def userResults = userCriteria {
                    'in'("id",managerIds)
                }
                project.managers = userResults
            }
            // if no errors, update the database and redirect
           	if (!project.hasErrors() && project.save()) {
           		def m=message(code:'project.nameUpdated', args:[params.name])
               	flash.message = "$m"
               	redirect(action:list)
           	}
            // if there is errors, we continue
           	else {
                
       			// breadcrumbname is the project name as default
    			def breadcrumbName = project.name

       			// if the project-name has errors, we set
       			// it as the old value, else the navigation-link is broken. 
   				if (breadcrumbName == "" || breadcrumbName.length() > 40)
   					breadcrumbName = oldName

                def bci = [:]
                bci.name = breadcrumbName
                bci.id = project.id
                def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,"edit",bci)
          		render(view:'edit',model:[project:project, "breadcrumb":breadcrumb, users:User.findAll(), selectedManagers:project.managers*.getProperty('id')])
           	}
        }
        else {
            def m=message(code:'project.idNotFound', args:[params.id])
            flash.message = "$m"
            redirect(action:edit,id:params.id)
        }
    }

    def add = {
        def project = new Project()
         project.properties = params
        
         def users = User.findAll()
         def selectedManagers = loggedInUserInfo(field:'id')
        def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,params.action, null)

        ['project':project,'users': users,"selectedManagers": selectedManagers,'breadcrumb':breadcrumb]
    }





    def save = {

       def project = new Project(params)

       if (params.managers) {
           def userCriteria = User.createCriteria();
           def managerIds = (params.managers instanceof String)?
               [Long.parseLong(params.managers)]:params.managers.collect{Long.parseLong(it)}

           def userResults = userCriteria {
               'in'("id",managerIds)
           }

           project.managers = userResults
       }
        if(!project.hasErrors() && project.save()) {
        	def m=message(code:'project.projectCreated', args:[project.name])
            flash.message = "$m"
            redirect(action:list)
        }
        else {
        	def breadcrumb = g.link(controller:"project", action:"list") +"${message(code:'project.projects')}" + " > "+ "${message(code:'project.addNewProject2')}"
            def users = User.findAll()
            render(view:'add',model:[project:project, 'users': users,'breadcrumb':breadcrumb])
        }
    }
}