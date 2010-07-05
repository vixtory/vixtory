import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib

class BreadcrumbService {

    boolean transactional = false;

    def getBreadcrumb(controller, action, projectItem) {
        return getBreadcrumb(controller, action, projectItem, null)
    }

    def getBreadcrumb(controller, action, projectItem, versionItem) {

        ApplicationTagLib g = new ApplicationTagLib();

        def breadcrumb = ""

        breadcrumb += g.link(controller: "project", action:"list",g.message(code:'project.projects'))
        if (projectItem) {
           // breadcrumb += " > " + g.link(controller:"project", action:"show", id:projectItem?.id, projectItem?.name)
        }
        if (versionItem) {
            //breadcrumb += " > " + g.link(controller:"version", action:"show", id:versionItem?.id, versionItem?.versionNumber)
        }
        if (action) {
            /* i.e. is translation key */ 
            if (action.contains(".")) {
                breadcrumb += " > " + g.message(code: action)            
            }
            else {
                breadcrumb += " > " + g.message(code:'common.' + action)
            }
        }

        return breadcrumb
    }
}
