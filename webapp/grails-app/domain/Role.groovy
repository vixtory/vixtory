import org.springframework.security.GrantedAuthority

class Role implements GrantedAuthority {
    
    String description
    String authority

    //static final ANONYMOUS = 'IS_AUTHENTICATED_ANONYMOUSLY'
    // Add your roles here so you can reference them, for instance:
    // static final ADMIN_USER = 'ROLE_ADMIN_USER'

     static final ANONYMOUS = 'IS_AUTHENTICATED_ANONYMOUSLY'
     static final ADMIN = 'ROLE_ADMIN'
     static final SUPER_USER = 'ROLE_SUPER_USER'
     static final USER = 'ROLE_USER'
     static final REPORT_READER = 'ROLE_REPORT_READER'

    // this are role collections for convenience
    static final LOGGEDIN_ROLES = [ ADMIN, SUPER_USER, USER, REPORT_READER ]
    static final ADMIN_ROLES = [ ADMIN,SUPER_USER]
    static final ALL_ROLES = [ ADMIN, ANONYMOUS, SUPER_USER, REPORT_READER ]

    // This list holds all roles, convenient when you're declaring controller methods
    // that should be available to everybody (see AccessController for instance).  When
    // you add roles to your system, make sure you add them to this list as well.
   // static final ALL_ROLES = [  ANONYMOUS ]
 	
    int compareTo(Object o) {
        if (o instanceof Role) {
            return this.authority.compareTo(o.authority)
        } 
         return 0
    }

    String toString() {
        return authority
    }
}	
