
class VersionController
{
    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']
    //stark authorizations
      static authorizations = [
        index: Role.LOGGEDIN_ROLES,
        list: Role.LOGGEDIN_ROLES,
        add: Role.LOGGEDIN_ROLES,
        edit: Role.LOGGEDIN_ROLES,
        show: Role.LOGGEDIN_ROLES,
        delete: Role.LOGGEDIN_ROLES,
        update: Role.LOGGEDIN_ROLES,
        save: Role.LOGGEDIN_ROLES,
        fixurl: Role.LOGGEDIN_ROLES,
        versionreqs: Role.LOGGEDIN_ROLES,
        requirements: Role.LOGGEDIN_ROLES
    ]

    def breadcrumbService
    
    def versionreqs = {
    		def version = Version.get(params.id)
    		def views = version.views
    		def project = version.project
    		def open = 0
    		def resolved = 0
    		def int resolvedPercent = 0
    		for (view in views) {
    			open = open + Requirement.countByViewAndStatus(view, RequirementStatus.OPEN)
    			resolved = resolved + Requirement.countByViewAndStatus(view, RequirementStatus.RESOLVED)
    		}
    		if (resolved != 0) {
    			resolvedPercent = resolved / (open + resolved) * 100
    		}
    		if (open == 0) {
    			resolvedPercent = 100
    		}
    		
    		['version':version, 'views':views, 'project':project, 'resolvedPercent':resolvedPercent]
    		
    }
    
    def requirements = {
    		def version = Version.get(params.id)
    		def views = version.views
    		def project = version.project
    		def open = 0
    		def resolved = 0
    		def int resolvedPercent = 0
    		for (view in views) {
    			open = open + Requirement.countByViewAndStatus(view, RequirementStatus.OPEN)
    			resolved = resolved + Requirement.countByViewAndStatus(view, RequirementStatus.RESOLVED)
    		}
    		if (resolved != 0) {
    			resolvedPercent = resolved / (open + resolved) * 100
    		}
    		
    		['version':version, 'views':views, 'project':project, 'resolvedPercent':resolvedPercent]
    		
    }

    
    def index = { redirect(action:list,params:params) }

    def list = {	
        def project = Project.get(params.projectId)
        ["project":project]
    }

    def add = {
    	def referer = request.getHeader("REFERER")
    	// Assign project id for which we add the new version
    	def projectId = params.projectId
    	def project = Project.get(projectId)

    	// we get the status of the project and transfer it to the view
    	def projectStatus = project.status

        def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,"addNewVersion",project)        
			  
    	["projectId":projectId,"breadcrumb":breadcrumb, "projectStatus":projectStatus]
    }

    def edit = {        
    	def version = Version.get(params.versionId)
    	
    	// we get the status of the project and transfer it to the view
    	def projectStatus = version.project.status

        def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,params.action,version.project,version)
			  		  
    	["version":version, "referer":request.getHeader("REFERER"), "breadcrumb":breadcrumb, "projectStatus":projectStatus]
    }

    /**
     * Show requested version.
     * If version was not found then show create-version-form
     * @param Version id that will be shown
     */
     def show = {
		def version = Version.get(params.id)
		
         // If version was not found, redirect to create-version-form
         if (!version)
         {
             render(view:'add')
         }

		// Take the whole requestURL in case that the requested url includes more than one parameter
        def url = version.url
        if (params.url)
		{
			//url = request.getQueryString()
            url = params.url
           
			// Parse the url from the parameters
			//url = url.substring(4)
		}
        def view = View.findByUrl(url)
        def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,"version.requirements",version.project,version)        

		["version":version, "currentURL":url, "breadcrumb": breadcrumb, "view":view]
    }

    /**
     * Delete requested version
     * @param Int Version id what will be deleted
     */
    def delete = {
        // Fetch version that corresponds to given id
    	def version = Version.get(params.id)
    	
    	if (version)
        {
            // Delete version
        	version.delete()
        	def m =message(code:'version.versionNumberDeleted', args:[version.versionNumber])
            render("$m")
        }
        else {
        	def e =message(code:'version.error')
        	def m =message(code:'version.versionNotFound', args:[params.id])
            render("$e: $m")
           
        }
    }
   
    def update = {
    	
        def version 
        //if the params.id does not exist them the params.versiid is used. versiid holds the information about version.id 
        if(params.id)
        {
        	version= Version.get(params.id)
        }
        else{
        	version= Version.get(params.versiid)
        	
        }
        def project = Project.get(version.project.id)
        def oldVersionNumber = version.versionNumber
        
        flash.error=null
        def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,"edit",version.project,version)
       
       	//if the version does not exist or the project has already the given version number and the 
		//given version number is not the same as the version, which is edited then user is redirect back to 
		//editing page
        if (!version || (Version.findByVersionNumberAndProject(params.versionNumber, project) && !oldVersionNumber.equals(params.versionNumber)))
        {
        	def m
        	
        	if(Version.findByVersionNumberAndProject(params.versionNumber, project)){
        		
        		m =message(code:'version.projectHasVersion', args:[params.versionNumber])
        	}
        	else{
        		m =message(code:'version.versionNotFound', args:[params.id])
        	}
        	flash.error = "$m"
        	def id
        	//check if id is given, if not then versiid is id
        	if(params.id)
        	{
        		id=params.id
        	}
        	else{
        	  id=params.versiid
        	}
        	render(view:'edit', model:[versi:params, versiid:id,projectId:project.id,"breadcrumb":breadcrumb])	
        	
        }
        else{
	        version.properties = params
	        version.url = fixurl(url: params.url)
	        if (!version.hasErrors() && version.save())
	        {
	            //if version is opened and project is closed
	            if (version.status == WorkStatus.IN_PROGRESS) {
	            	if (version.project.status == WorkStatus.CLOSED) {
	                	//we open the project
	            		version.project.status = WorkStatus.IN_PROGRESS
	            		version.project.save()
	            	}
	            }
				def m =message(code:'version.versionUpdated', args:[version.versionNumber])
	            
	        	flash.message = "$m"
	        
	            redirect(controller:"project",action:"list")
	        }
	        else 
	        {
				def versionNumber = (!version.versionNumber) ? oldVersionNumber : version.versionNumber
	        	render(view:'edit', model:[version:version, projectId:params.projectId,"breadcrumb":breadcrumb])
	        }
        }
    }

    def save = {
     
        def version = new Version(params)
        def project = Project.get(params.projectId)
  
        version.url = fixurl(url: version.url)
        if(version.versionNumber && version.description && version.shortName && version.url.size() > 8 && version.url.contains(".")){
        		//if version does not exist in current project
        		if(Version.findByVersionNumberAndProject(version.versionNumber, project)==null)
        		{
        			project.addToVersions(version)
        			flash.error=null
        	     }
        	     //creates an error message if project has already a version with the same version number
        	     else{
        	     	def m=message(code:'version.projectHasVersion', args:[version.versionNumber])
        			flash.error = "$m"
        	     }
           
        }

        if (!version.hasErrors() &&  version.save()  )
        {

       	 //if version is opened and project is closed
            if (version.status == WorkStatus.IN_PROGRESS) {
            	if (project.status == WorkStatus.CLOSED) {
                	//we open the project
            		project.status = WorkStatus.IN_PROGRESS
            		project.save()
            	}
            }
			def m =message(code:'version.versionCreated', args:[version.versionNumber])
        	flash.message = "$m"

            redirect(controller:"project",action:"list")
        }
        else {
			//def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,"addNewVersion",project)

            def breadcrumb = breadcrumbService.getBreadcrumb("version","addNewVersion",project)


			/*def breadcrumb =
				  g.link(controller:"project", action:"list") { 'Projects' } + " > " +
				  g.link(controller:"project", action:"edit", id:project.id) { project.name } + " > " +
				  "Add new version"*/
    render(view:'add', model:[version:version, projectId:params.projectId,"breadcrumb":breadcrumb])
            //render(view:'add', model:[version:version, projectId:params.projectId,"breadcrumb":"" breadcrumb])

        }   
    }


    def fixurl = {
    
    	def url = params.url;		
		if(url.length() > 7) {
			if(!url.substring(0,7).equals('http://') && !url.substring(0,8).equals('https://')) {
			url = 'http://' + url
			}
		}
		else {
			if(!url.equals("http://")){
			url = 'http://' + url}
		}

	
		return url;
    }
    
    
    
}