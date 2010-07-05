<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <style type="text/css">
        	html, body, #header {
        		height: 100%;
        		padding:0;
        		margin: 0;
        	}
        </style>				
    </head>
    

    <body>
    <div id="header">
     <div id="vixheaderTop">
                          
                        <div id="vixheaderTopUserStuff">
                           <g:isLoggedIn>
                           <strong><g:loggedInUserInfo field="userRealName"/></strong>  | <g:link controller="access" action="logout"><g:message code="common.logout" /></g:link>
                           </g:isLoggedIn>
                           <g:isNotLoggedIn>
                           <g:link controller="login"><g:message code="common.logIn" /></g:link>
                           </g:isNotLoggedIn>
                        </div>
                        <div id="vixhelpLink">
			   <g:link controller="help"><img src="${createLinkTo(dir:'images',file:'help.gif')}" alt="" /></g:link>
                         </div>
		        <!-- BREADCRUMP  -->
                        <div id="vixnaviPath">
      
				${breadcrumb}
			 </div>
                         
          	 </div>


     <div id="darkline"></div>

    <div id="vixcontent">
    <g:layoutBody />
    </div>

       
    </body>
</html>
