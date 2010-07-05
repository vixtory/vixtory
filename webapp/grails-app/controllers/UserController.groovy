
import org.codehaus.groovy.grails.plugins.starksecurity.PasswordEncoder

class UserController {

       static authorizations = [
        create: Role.ADMIN_ROLES,
        delete: Role.ADMIN_ROLES,
        edit: Role.ADMIN_ROLES,
        index: Role.ADMIN_ROLES,
        list: Role.ADMIN_ROLES,
        save: Role.ADMIN_ROLES,
        show: Role.ADMIN_ROLES,
        changepwd: Role.ADMIN_ROLES,
        update: Role.ADMIN_ROLES
    ]

    def breadcrumbService;
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        def breadcrumb = "${message(code:'common.adminsection')}"
        [ userInstanceList: User.list( params ), userInstanceTotal: User.count(),'breadcrumb': breadcrumb ]
    }

    def show = {
        def userInstance = User.get( params.id )

        if(!userInstance) {
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ userInstance : userInstance ] }
    }

    def delete = {
        def userInstance = User.get( params.id )
        if(userInstance) {
            try {
                userInstance.delete()
                flash.message = "User ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "User ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def userInstance = User.get( params.id )

        if(!userInstance) {
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,params.action,userInstance)
            return [ userInstance : userInstance,"breadcrumb":breadcrumb ]
        }
    }

    def update = {
        def userInstance = User.get( params.id )
        if(userInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "user.optimistic.locking.failure", "Another user has updated this User while you were editing.")
                    render(view:'edit',model:[userInstance:userInstance])
                    return
                }
            }
            userInstance.properties = params

            if (params.password){
            userInstance.password=PasswordEncoder.encode(params.password, 'SHA-256', true)
            }
            if(!userInstance.hasErrors() && userInstance.save()) {
                flash.message = "User ${params.id} updated"
                redirect(action:show,id:userInstance.id)
            }
            else {
                render(view:'edit',model:[userInstance:userInstance])
            }
        }
        else {
            flash.message = "User not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return ['userInstance':userInstance]
    }

    def changepwd = {

        def userInstance = User.get( params.id )

        if(!userInstance) {
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            def breadcrumb = breadcrumbService.getBreadcrumb(params.controller,params.action,userInstance)
            return [ userInstance : userInstance,"breadcrumb":breadcrumb ]
        }

    }

    def save = {
        def userInstance = new User(params)
        userInstance.password=PasswordEncoder.encode(params.password, 'SHA-256', true)
        if(!userInstance.hasErrors() && userInstance.save()) {
            flash.message = "User ${userInstance.id} created"
            redirect(action:show,id:userInstance.id)
        }
        else {
            render(view:'create',model:[userInstance:userInstance])
        }
    }
}
