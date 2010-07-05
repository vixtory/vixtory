/**
 * Grails configuration class for Vixtory URL mappings.
 *
 * @see http://grails.org/doc/1.0.x/guide/single.html#6.4%20URL%20Mappings
 */
class UrlMappings
{
	static mappings = {
		
		/** ERRORS-RELATED MAPPINGS */

		"404"							(controller:"errors", action:"notFound")
		"/$controller/$action?/$id?"	()

        // Mapping for the root / login - page. This will probably be directed to the user controller
		// when it is added but for now it's been directed for the project-controller.
		// "/"                     (controller:"project", action:"login")
        "/" (controller:"project", action:"list")

        /** PROJECT-RELATED MAPPINGS */

        "/project/list/$order?" (controller:"project", action:"listclosed")
        "/project/list/$order?" (controller:"project", action:"list")
		"/project/add"          (controller:"project", action:"add")
		"/project/save"         (controller:"project", action:"save")
		"/project/update"       (controller:"project", action:"update")
        "/project/$id/delete"   (controller:"project", action:"delete")
        "/project/$id/edit"     (controller:"project", action:"edit")
        "/project/$id/show"     (controller:"project", action:"show")

        /** VERSION-RELATED MAPPINGS */

        /** Listing versions for a project */
        "/project/$projectId/version/add"               (controller:"version", action:"add")
        "/project/$projectId/version/$versionId?/list"  (controller:"version", action:"list")
        "/project/$projectId/version/$versionId/edit"   (controller:"version", action:"edit")
        "/version/$id/delete"                           (controller:"version", action:"delete")
        "/version/$id/show"                             (controller:"version", action:"show")
        "/version/update"                               (controller:"version", action:"update")
        "/version/save"                                 (controller:"version", action:"save")
        "/version/delete"                               (controller:"version", action:"delete")
        "/version/$id/versionreqs"          		(controller:"version", action:"versionreqs")

        /** REQUIREMENT-RELATED MAPPINGS */

		 "/requirement/$id/list"                    (controller:"requirement", action:"list")
		 "/requirement/$id/delete"                  (controller:"requirement", action:"delete")
		 "/requirement/$id/deleteMultiple"          (controller:"requirement", action:"deleteMultiple")
		 "/requirement/$id/save"                    (controller:"requirement", action:"save")
		 "/requirement/$id/$versionId/changeReq"    (controller:"requirement", action:"changeReq")
		 "/requirement/$id/resolve"					(controller:"requirement", action:"resolve")
		 "/requirement/$id/reopen"					(controller:"requirement", action:"reopen")
		 "/requirement/$id/update"                  (controller:"requirement", action:"update")
		 "/requirement/$id/reqAction"               (controller:"requirement", action:"reqAction")

		/** VIEWS AND PRINTING */
		
        "/view/$id/print"       (controller:"view", action:"print")
		"/view/$id/printLatest" (controller:"view", action:"printLatest")
		"/view/$id/requirements" (controller:"view", action:"requirements")

		/** PROXY */
		
		"/proxy/$id/get"        (controller:"proxy", action:"get")
		"/proxy/load"			(controller:"proxy", action:"load")
		"/proxy/post"			(controller:"proxy", action:"dopost")


        /** admin */

        "/admin"                 (controller:"user", action:"list")
        "/user"                  (controller:"user", action:"list")
       "/user/ceate"             (controller:"user", action:"create")
       "/user/index"             (controller:"user", action:"index")
 
         "/user/$id/show"        (controller:"user", action:"show")
         "/user/$id/list"        (controller:"user", action:"list")
		 "/user/$id/delete"      (controller:"user", action:"delete")
		 "/user/$id/save"        (controller:"user", action:"save")
		 "/user/$id/update"      (controller:"requirement", action:"update")





		/** HELP */
		
		"/help"        (controller:"help", action:"index")
	}
}