

class ProxyController {
   
     static authorizations = [
        load: Role.LOGGEDIN_ROLES,
        dopost: Role.LOGGEDIN_ROLES
    ]


    def proxyService

  
    //load method is called with url "/vixtory/proxy/load?url=xxx", see url mappings	
    def load = {
    	log.debug "proxy loading: ${params.url}"  	
    	def ctx="http://${request.getServerName()}:${request.getServerPort()}${request.getContextPath()}"
    	def o=proxyService.getUrl(params,ctx,"get")
    	render(o)
    }
    	
    //dopost method is called with url "/vixtory/proxy/post?url=xxx", see url mappings
    def dopost={
    	log.debug "proxy post method: ${params.url}" 
    	println("POST orig url: ${params.url}")
    	params.each{render(it.key);render("=");render(it.value);render("<br>")}
    	render("post request is almost implemented..")
    	//def ctx="http://${request.getServerName()}:${request.getServerPort()}${request.getContextPath()}"
    	//def o=proxyService.getUrl(params,ctx,"post")
    	//render(o)
    	}
    
}