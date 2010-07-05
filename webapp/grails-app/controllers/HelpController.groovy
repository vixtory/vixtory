class HelpController {
    
  static authorizations = [
        index: Role.LOGGEDIN_ROLES
    ]
    
    	def index = { 
		def breadcrumb = "${message(code:'common.help')}"
		['breadcrumb': breadcrumb]
	}
}
