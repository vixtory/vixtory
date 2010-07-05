

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show User</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
        </div>
        <div class="body">
            <h1>${fieldValue(bean:userInstance, field:'userRealName')}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'id')}</td>
                            
                        </tr>

  <tr class="prop">
                            <td valign="top" class="name">User Real Name:</td>

                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'userRealName')}</td>

                        </tr>

  <tr class="prop">
                            <td valign="top" class="name">Username:</td>

                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'username')}</td>

                        </tr>
                    
                    
                        <!--
                        <tr class="prop">
                            <td valign="top" class="name">Password:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'password')}</td>
                            
                        </tr>
-->

                    
                        <tr class="prop">
                            <td valign="top" class="name">Roles:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
<!--
                                <g:each var="r" in="${userInstance.roles}">
                                    <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
-->

<g:each var="r" in="${userInstance.roles}">
                                    <li>${r?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                      
                    
               <!--
                        <tr class="prop">
                            <td valign="top" class="name">Account Non Expired:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'accountNonExpired')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Account Non Locked:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'accountNonLocked')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Authorities:</td>
                            
                            <td valign="top" class="value"><g:link controller="null" action="show" id="${userInstance?.authorities?.id}">${userInstance?.authorities?.encodeAsHTML()}</g:link></td>
                            
                        </tr>

                   
                        <tr class="prop">
                            <td valign="top" class="name">Credentials Non Expired:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'credentialsNonExpired')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Enabled:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'enabled')}</td>
                            
                        </tr>

-->

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${userInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
