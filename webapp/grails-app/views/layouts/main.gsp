<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
	<div id="header">
		<div id="headerTop">
			<div id="headerTopAgileTitle">
                <g:link controller="project">
                   <!-- <img src="${createLinkTo(dir:'images',file:'at-red.gif')}" alt="" /> -->
                    <h1><g:message code="common.vixtory" /></h1>
                </g:link>
            </div>

			<div id="headerTopUserStuff">
                <g:isLoggedIn>
                    <strong><g:loggedInUserInfo field="userRealName"/></strong>  | <g:link controller="access" action="logout"><g:message code="common.logout" /></g:link>

<g:ifAnyGranted role="ROLE_ADMIN"><br><g:link controller="user" action="list"><g:message code="common.adminsection"/></g:link></g:ifAnyGranted>
                </g:isLoggedIn>
                <g:isNotLoggedIn>
                    <g:link controller="access" action="login"><g:message code="common.logIn" /></g:link>
                </g:isNotLoggedIn>            </div>

		<div id="helpLink">
			<g:link controller="help"><img src="${createLinkTo(dir:'images',file:'help.gif')}" alt="" /></g:link>
		</div>

		</div>
		
		<div id="headerBottom">
			<div id="naviPath"> 
				${breadcrumb}
			</div>
		</div>
		<div id="redLine"></div>

	</div>

    <div id="content">
    <g:layoutBody />
    </div>

    <div id="footer"></div>
    

    </body>  
</html>
