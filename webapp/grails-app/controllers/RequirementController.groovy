
class RequirementController {

     // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    static authorizations = [
        index: Role.LOGGEDIN_ROLES,
        list: Role.LOGGEDIN_ROLES,
        show: Role.LOGGEDIN_ROLES,
        delete: Role.LOGGEDIN_ROLES,
        edit: Role.LOGGEDIN_ROLES,
        changeReq: Role.LOGGEDIN_ROLES,
        create: Role.LOGGEDIN_ROLES,
        getRequirements: Role.LOGGEDIN_ROLES,
        reqAction: Role.LOGGEDIN_ROLES,
        update: Role.LOGGEDIN_ROLES,
        save: Role.LOGGEDIN_ROLES,
        resolve: Role.LOGGEDIN_ROLES,
        reopen: Role.LOGGEDIN_ROLES,
        deleteMultiple: Role.LOGGEDIN_ROLES,
    ]


	// error-values
	def errorValue = "false"
	def titleError = "false"
    def creatorError = "false"
	def descriptionError = "false"

    def index = { redirect(action:list,params:params) }



    /**
     * Show requirements for requested verision's view (Used with AJAX)
     * @param Int Version id
     * @param String Current url
     * @return String Html text where all requirements are listed
     */
    def list = {
		// Get this versions views
		def version = Version.get(params.id)
		def url = params.currentURL

		def views = version.views
		def currentView = null

		// Loop through views and see if requirements are found for this url
		for(view in views) {
			// We have found the right view if it's url is the same as the current url
			if(view.url == url) {
	   			currentView = view
	   			break
   			}
   		}

		// If view was found for current url we can fetch possible requirements for it
    	if(currentView) {
            def status = RequirementStatus.valueOf(params.status.toUpperCase())
            render getRequirements(version, currentView, status)
    	}
		else {
			if(params.status.equals("open")){
				def m =message(code:"requirement.noRequirementView")
            	render "$m"
			}
			else
				render ""
		}
    }

    def show = {
        [version:version, requirement : Requirement.get( params.id ) ]
    }

    /**
     * Delete requested requirement
     * @param Int Requirement id which is going to be deleted
     */
    def delete = {
        def requirement = Requirement.get( params.id )

        // If requirement was found for this id
        if(requirement) {
            // Delete requirement and assign message for user
        	requirement.delete()
        	def r =message(code:"requirement.idDeleted", args:[params.id])
            render "$r"

        }
        else {
        	def r =message(code:"requirement.idNotFound", args:[params.id])
            render "$r"

        }
    }

    def edit = {
        def requirement = Requirement.get( params.id )

        if(!requirement) {
        	def r =message(code:"requirement.idNotFound", args:[params.id])
            flash.message = "$r"
            redirect(action:list)
        }
        else {
            return [version:version, requirement : requirement ]
        }
    }

    /**
     * Change requirements attributes. For now only description and edit date are changed.
     */
    def changeReq = {
        def req = Requirement.get(params.id)
        def view = req.view
        def version = Version.get(params.versionId)
        def m;

        if(params.text)
        	req.description = params.text
 		if(params.x && params.y)
 			req.coordinates = params.x + "," + params.y

        req.editDate = new Date()
        req.save()

        if(view) {
            render getRequirements(version, view, RequirementStatus.OPEN)
       	}
        else
             m=message(code:"requirement.noRequirementView")
            	render "$m."
    }

    def create = {
        def requirement = new Requirement()
        requirement.properties = params
        return [version:version,'requirement':requirement]
    }

    /**
     * Get all requirements for requested view
     * @param Version Version to get short_name for the requirements
     * @param View View which requirements are fetched
     * @return String Html text where all requirements are listed
     */
    def getRequirements(Version version, View view, RequirementStatus status) {
		// Fetch all requirements from requested view
   		//def requirements = view.requirements
        def requirements = Requirement.findAllByViewAndStatus(view, status, [sort:"priority", order:"asc"])
        def reqTexts = ""
        def reqHeaderClass = ""

   		if(requirements) {
   			// Loop through requirements and create requirements-text in html-form
	   		for(r in requirements) {
	   			if(r.status.equals(status)) {
		   			def coords = r.coordinates.split(",")

		   			    reqTexts += "<div class=\"requirement2\" id='"+version.shortName+"'"
			   			//reqTexts += "onmouseout=\"hidePopup('" + version.shortName + "-" + r.id + "',this)\""
			   			reqTexts += "onmouseover=\"showPopup(" + coords[0] + "," + coords[1] + ",'" + version.shortName + "-" + r.id + "',this)\""
			   			//reqTexts += "onclick=\"activatePopup('" + version.shortName + "-" + r.id + "',this)\""
			   			reqTexts += "id=\"req-" + r.id + "\">"

			   			reqTexts += "<div style=\"margin-left: 0px;\">"
			   			reqTexts += "<img id=\"requirementImage"+r.id+"\" class=\"expand\" onclick=\"expand_collapse_link(this,"+r.id+")\" name=\"reqData" + r.id + "\" src=\"${g.createLinkTo(dir:'images', file:'plus.jpg')}\" alt=\"+\" />"
			   			reqTexts += "</div>"

			   			//sets the right style class for requirements according to their priority and status
			   			reqHeaderClass = "prio" + r.priority.ordinal()

			   			if(status.equals(RequirementStatus.RESOLVED))
						{
							reqHeaderClass += " statusResolved"
						}

			   			reqTexts += "<div class=\"boxAndEdit\">"

			   			// Don't show checkbox if already resolved
			   			if(status.equals(RequirementStatus.OPEN))
			   			{
			   				reqTexts += "<input type=\"checkbox\" class=\"box\" onclick=\"checkCheckBoxes('openrequirements');\" name=\"selectedRequirements[]\" value=\"" + r.id + "\"  />"
			   				reqTexts += "<img style=\"margin-left: 7px; cursor: pointer;\"  src=\"${g.createLinkTo(dir:'images', file:'edit.png')}\" onclick=\"showDialog('edit', '" + version.shortName + "-" + r.id + "'"+"," + r.id + ");\" />"
			   			}
			   			else if(status.equals(RequirementStatus.RESOLVED))
			   			{
			   				reqTexts += "<input type=\"checkbox\" class=\"box\" onclick=\"checkCheckBoxes('closedrequirements');\" name=\"reopenedRequirements[]\" value=\"" + r.id + "\" />"
			   			}

						reqTexts += "</div>"

			   			// added title to header -petrik
			   			reqTexts += "<div class=\"reqHeader " + reqHeaderClass + "\">"
			   			reqTexts += "<span onclick='showSubDiv("+r.id+")' style='cursor: pointer;'>" + version.shortName + "-" + r.id + " " + r.title +"</span>"
			   			reqTexts += "</div>"

			   			reqTexts += "<div class=\"requirementData\" id=\"reqData" + r.id + "_id\" style=\"display:none; margin-top: 5px;\">"

			   				// the priority of the requirement as a hidden field
							reqTexts += "<span id=\"priority-" + version.shortName + "-" + r.id + "\" style=\"display:none;\">" + r.priority + "</span>"

							// the description as a hidden field
							reqTexts += "<span id=\"" + version.shortName + "-" + r.id + "\">" + r.description + "</span>"

							// the title as a hidden field
							reqTexts += "<span id=\"title-" + version.shortName + "-" + r.id + "\" style=\"display:none;\">" + r.title + "</span>"

							// the requirement id as a hidden field
							reqTexts += "<span id=\"id-" + version.shortName + "-" + r.id + "\" style=\"display:none;\">" + r.id + "</span>"
				   			reqTexts += "<br/>"

				   			// id for creator to get it with javascript
				   			reqTexts += "<div><span id=\"creator-" + version.shortName + "-" + r.id + "\">" + r.creator + "</span> @ " + r.creationDate.toString().split(" ")[0] + "</div>"

				   			// only print edit and delete if they're not resolved
				   			if(status.equals(RequirementStatus.OPEN)) {
				   				reqTexts += "<a href=\"#\" onclick=\"if (confirmDelete()) { new Ajax.Updater({success:'message',failure:'error'},'${createLink(controller:'requirement', action:'delete', id:r.id)}',{asynchronous:true,evalScripts:true,onSuccess:function(e){deleteField('req-"+r.id+"')}});return false;}\" class=\"b\">${message(code:'common.delete')}</a>"
	   						}
			   			reqTexts += "</div>"

			   		reqTexts += "</div>"
			   		reqTexts += "<script type=\"text/javascript\"> updateOpenedDivs();</script>"

	   			}

	   		}

   			// the error values returned    style=\"display:none;\"
   			reqTexts += "<span style=\"display:none;\" id=\"errorValue\">" + errorValue + "</span>"
   			reqTexts += "<span style=\"display:none;\" id=\"creatorError\">" + creatorError + "</span>"
	   		reqTexts += "<span style=\"display:none;\" id=\"titleError\">" + titleError + "</span>"
	   		reqTexts += "<span style=\"display:none;\" id=\"descriptionError\">" + descriptionError + "</span>"

			return reqTexts
   		}
   		else
   			if(status.equals(RequirementStatus.OPEN))
   			{
   				reqTexts = "No requirements for this view."
				// the error values returned
                reqTexts += "<span style=\"display:none;\" id=\"creatorError\">" + creatorError + "</span>"
                reqTexts += "<span style=\"display:none;\" id=\"errorValue\">" + errorValue + "</span>"
   				reqTexts += "<span style=\"display:none;\" id=\"titleError\">" + titleError + "</span>"
   				reqTexts += "<span style=\"display:none;\" id=\"descriptionError\">" + descriptionError + "</span>"
   				return reqTexts
   			}
   			else
   			{
				// the error values returned
				reqTexts += "<span style=\"display:none;\" id=\"creatorError\">" + creatorError + "</span>"
   				reqTexts += "<span style=\"display:none;\" id=\"errorValue\">" + errorValue + "</span>"
   				reqTexts += "<span style=\"display:none;\" id=\"titleError\">" + titleError + "</span>"
   				reqTexts += "<span style=\"display:none;\" id=\"descriptionError\">" + descriptionError + "</span>"
   				return reqTexts
   			}
    }

    /**
     * Update or save requiremenet. Will use either save or update according to the parameter.
     */
    def reqAction = {
    		if (params.actionType == "save")
    			save()
    		else if (params.actionType == "update")
    			update()
    }

    /**
     * Update requirement
     */
     def update = {
		// we get the requirement which is given as parameter
   		 def requirement = Requirement.get( params.reqId )

        if(requirement) {
        	// we get the old values which will be asserted if the save doesn't work
        	def oldDescription = requirement.description
        	def oldTitle = requirement.title
        	def oldCreator = requirement.creator
        	def oldPriority = requirement.priority
        	Date oldDate = requirement.editDate


        	// If the requirement is found, we set the new parameters to it
            requirement.properties = params
			requirement.editDate = new Date()

            // if the update is succesfull, we render update-message and all the requirements
            if(!requirement.hasErrors() && requirement.save()) {

				// We se the errorvalues to false
				creatorError = 'false'
                errorValue = "false"
                titleError = "false"
                descriptionError = "false"

            	def view = requirement.view
            	redirect(action:list, params:[id:params.id,currentURL: view.url, status:RequirementStatus.OPEN])

                // Rendering the requirements again
                //render getRequirements(Version.get(params.id), requirement.view, "open")
            }
            // else we set the error-values so the dialog wont be closed
            else {

            	// Set the errorvalues to true

            	errorValue = "true"
                if (params.description == "")
                	descriptionError = "true"
                else
                	descriptionError = "false"

                if (params.title == "")
                	titleError = "true"
				else
                  	titleError = "false"

                if (params.creator == "")
                	creatorError = "true"
				else
                  	creatorError = "false"

                // Set the old values to the parameters
                requirement.description = oldDescription
                requirement.title = oldTitle
                requirement.creator = oldCreator
                requirement.priority = oldPriority
                requirement.editDate = oldDate

				// Rendering the requirements again
                render getRequirements(Version.get(params.id), requirement.view, RequirementStatus.OPEN)
            }
        }
    	// If the requirement is not found, we print error
        else {
        	def m =message(code:"requirement.idNotFound",args:[params.reqId])
        	def p =message(code:"requirement.checkParameters")
            render "$m. $p."

        }

    }

    /**
     * Save requirement
     */
     def save = {
    	def version = Version.get(params.id)
 		def views = version.views
 		def currentView

 		// If version has existing views
   		if(views) {
		// Loop through views and see if requirements are found for this url
   			for(view in views) {
   				// We have found the right view if it's url is the same
   				// as the current url in iframe
   				if(view.url == params.viewURL) {
   		   			currentView = view
   		   			break
   	   			}
   	   		}
   		}
    	def requirement
    	// first we check if the description and title are not empty.
    	// if they are not, we create new object.
		if (params.description != "" && params.title != "") {

			Date timeNow = new Date();

			// Create new requirement object with given params
	   		requirement = new Requirement(
   				title: params.title,
   				creator: params.creator,
   				status: RequirementStatus.OPEN,
                description: params.description,
                priority: params.priority,
                coordinates: params.mouseX + "," + params.mouseY,
                creationDate: timeNow,
                editDate: timeNow)

		}

    	if(params.creator)
    	{
    	      session["activeUser"] = params.creator
    	}

   		if (requirement) {
   			// If current url was not found and we have a requirement - object,
   			// we need to create a new view for this url
   	   		if(!currentView) {
   	   			Date time = new Date();
   	   			currentView = new View(url: params.viewURL, creationDate: time)
   	   			version.addToViews(currentView)
   	   		}
   			// First add requirement to view
	   		currentView.addToRequirements(requirement)
   			// Then save. Otherwise we won't be able to save requirement
			currentView.save()
	    }

		// if there is no error, the error value is false, else its true
        if(requirement && requirement.save()) {
            creatorError = "false"

            errorValue = "false"
        	titleError = "false"

        	descriptionError = "false"

        	// refreshes the requirement so that we get
        	// correct information when rendering it
        	requirement.refresh()
        }
        else {
        	errorValue = "true"

        	// if description is blank, we set its error to true
        	if (params.description == "")
        		descriptionError = "true"
        	else
        		descriptionError = "false"

			// if title is blank, we set its error to true
        	if (params.title == "")
        		titleError = "true"
        	else
        		titleError = "false"

        	if (params.creator == "")
        		creatorError = "true"
        	else
        		creatorError = "false"
        }

        def noRequirementsMessage = ""

        // if there is a view, we print the views.
   		if(currentView)
			render getRequirements(version, currentView, RequirementStatus.OPEN)
		else
			// we always also print the error-values

			noRequirementsMessage += "${message(code:'requirement.noRequirementView')}."
			noRequirementsMessage += "<span style=\"display:none;\" id=\"creatorError\">" + creatorError + "</span>"

			noRequirementsMessage += "<span style=\"display:none;\" id=\"errorValue\">" + errorValue + "</span>"
			noRequirementsMessage += "<span style=\"display:none;\" id=\"titleError\">" + titleError + "</span>"

			noRequirementsMessage += "<span style=\"display:none;\" id=\"descriptionError\">" + descriptionError + "</span>"

			render noRequirementsMessage
    }

 	def resolve = {
    	def resolvedRequirements = request.getParameterValues("selectedRequirements[]")
    	def version = Version.get(params.id)
 		def currentView

    	for(req in resolvedRequirements) {
    		req = Requirement.get(req)
    		req.status = RequirementStatus.RESOLVED
   			currentView = req.view
   	   	}
    	render getRequirements(version, currentView, RequirementStatus.OPEN)
    }

    def reopen = {
    		//checkboxed requirements to be reopened
        	def reopenedRequirements = request.getParameterValues("reopenedRequirements[]")
        	def version = Version.get(params.id)
     		def currentView

     		//we change requirements status
        	for(req in reopenedRequirements) {
        		req = Requirement.get(req)
        		req.status = RequirementStatus.OPEN
       			currentView = req.view
       	   	}
			//we render the resolved requirements field
        	render getRequirements(version, currentView, RequirementStatus.RESOLVED)
        }

    def deleteMultiple = {
        	def deletedRequirements = request.getParameterValues("selectedRequirements[]")
        	def version = Version.get(params.id)
     		def currentView

        	for(req in deletedRequirements) {
        		req = Requirement.get(req)
       			currentView = req.view
       			req.delete()
       	   	}
        	render getRequirements(version, currentView, RequirementStatus.OPEN)
        }
}
