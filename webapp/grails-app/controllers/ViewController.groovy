/**
 * View - classes controller
 */
class ViewController
{
      static authorizations = [
        requirements: Role.LOGGEDIN_ROLES,
        print: Role.LOGGEDIN_ROLES,
        printLatest: Role.LOGGEDIN_ROLES
    ]

    def proxyService
    /**
     * Views all the urls and requirements with iframe-zoom. Works only with Internet Explorer.
     *  @param Int Version id which we are going to show
     */
    def requirements = {
    	    def currentView = View.get(params.id)
    		def version = Version.get(params.v)
    		['version':version, 'currentView':currentView]
    }
     
     
    def print = {

            // we get the version, its project and its requirements
    		def version = Version.get(params.id)
            def project = version.project
            def views = version.views
            
            def zoomLevel
            def fontSize

	        // we set the default zoomlevel=40 and fontsize=12.
            if (request.getParameter("zoomLevel") == null)
                zoomLevel="40";
            else
                zoomLevel=request.getParameter("zoomLevel");

            if (request.getParameter("fontSize") == null)
                fontSize="12px";
            else
                fontSize=request.getParameter("fontSize");           
			
            // we assign the version, the project and the views to the print view
            // we also assing zoom-level and font-size
            ['project':project, 'version':version, 'views':views, 'zoomLevel': zoomLevel, 'fontSize': fontSize]

    }
    /**
     * Fetch newes version for requested project and shows the print-view of it
     */
    def printLatest = {
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
	    	redirect(controller:"view",action:"print",params:[id:newestVersion.id])
	     }
    	// Else redirect to new version form
		else {
			redirect(controller:"version",action:"add",params:[projectId: params.id])
		}
    }
}