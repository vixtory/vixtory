class ErrorsController {

      static authorizations = [
        notFound: Role.LOGGEDIN_ROLES,
    ]

    def notFound = {
    	def breadcrumb = "${message(code:'error.notFound')}"
		render(view:'notFound', model:['breadcrumb': breadcrumb])
    }    
}
