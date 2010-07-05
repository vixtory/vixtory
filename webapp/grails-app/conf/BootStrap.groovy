import org.codehaus.groovy.grails.plugins.starksecurity.PasswordEncoder


class BootStrap {

    def init = {
        servletContext ->
        initStark()
        createProject3()
    }



    def initStark = { servletContext ->

        // Create some roles
        new Role(authority: 'ROLE_ADMIN', description: 'admin oikeudet').save()
        new Role(authority: 'ROLE_USER', description: 'perusoikeudet').save()


        //Create a user, and add the super user role
        //You do this only if you're using the DAO implementation, for LDAP users don't live in your DB.
        def adminuser = new User(username: 'admin', userRealName:'Mr. Administrator',password: PasswordEncoder.encode('admin', 'SHA-256', true))
        def demouser = new User(username: 'demo', userRealName:'Mr. Demo',password: PasswordEncoder.encode('demo', 'SHA-256', true))

        adminuser.save()
        demouser.save()

        adminuser.addToRoles(Role.findByAuthority('ROLE_ADMIN'))
        adminuser.save()

        demouser.addToRoles(Role.findByAuthority('ROLE_USER'))
        demouser.save()
    }



    def createProject3 = {

        def p3 = new Project(name:"vixtory.com", status: WorkStatus.IN_PROGRESS, description:"The home site of Vixtory")

        def manager = User.findByusername("demo")
        p3.addToManagers(manager)
        p3.save()

        def p3_version1 = new Version(
            versionNumber: "1.0",
            description: "The first version of Vixtory.com",
            url: "http://www.vixtory.com/",
            status: WorkStatus.IN_PROGRESS,
                shortName: "AT1",
        		iframe:Iframe.FIRST)

        p3.addToVersions(p3_version1).save()
    }
    
 
    def destroy = {
    }
} 
