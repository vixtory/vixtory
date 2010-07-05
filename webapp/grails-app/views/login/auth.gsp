<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
	<head>
		<title><g:message code="common.vixtory" /></title>

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />
	<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'style.css')}">
	<meta name="layout" content="main" />
</head>
<body>
    <div id="loginContainer">
        <!--<img id="vixtory-logo" src="${createLinkTo(dir:'images',file:'at_logo.png')}" alt="" class="logo" />-->
        <h2><g:message code="login.welcome" /></h2>

        <p><g:message code="login.please" />.<%--(<strong>admin/admin</strong>)--%></p>

        <g:if test="${flash.message}">
            <div class="login_message">${flash.message}</div>
        </g:if>

        <form action="../j_spring_security_check" method="POST" id="loginForm" class="cssform">
             <table id="login" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th><g:message code="login.username" />:</th>
                    <td><input id="username" type="text" name="j_username" /></td>
                </tr>
                 <tr>
                     <th><g:message code="login.password" />:</th>
                     <td><input id="password" type="password" name="j_password" /></td>
                 </tr>
                 <tr>
                     <th><label for="remember_me"><g:message code="login.rememberMe" />:</label></th>
                     <td><input type="checkbox" class="chk" name="_spring_security_remember_me" id="remember_me" /></td>
                 </tr>
                 <tr>
                     <th>&nbsp;</th>
                     <td><input id="login-button" type="submit" value="${message(code:"login.login")}" /></td>
                 </tr>
             </table>
       </form>

  <g:javascript library="jquery" />
  <g:javascript src="login.js" />

    </div>
</body>
