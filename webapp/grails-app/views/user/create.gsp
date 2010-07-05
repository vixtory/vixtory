

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create User</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
        </div>
        <div class="body">
            <h1>Create User</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
                <div class="errors">
                    <g:renderErrors bean="${userInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userRealName">User Real Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'userRealName','errors')}">
                                    <input type="text" id="userRealName" name="userRealName" value="${fieldValue(bean:userInstance,field:'userRealName')}"/>
                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:userInstance,field:'username')}"/>
                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'password','errors')}">
                                    <input type="text" id="password" name="password" value="${fieldValue(bean:userInstance,field:'password')}"/>
                                </td>
                            </tr>









                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="roles">Roles:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'roles','errors')}">
                                    <g:select name="roles"
                                              from="${Role.list()}"
                                              size="5" multiple="yes" optionKey="id"
                                              value="${userInstance?.roles}" />

                                </td>
                            </tr>

<!--
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountNonExpired">Account Non Expired:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'accountNonExpired','errors')}">
                                    <g:checkBox name="accountNonExpired" value="${userInstance?.accountNonExpired}"></g:checkBox>
                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountNonLocked">Account Non Locked:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'accountNonLocked','errors')}">
                                    <g:checkBox name="accountNonLocked" value="${userInstance?.accountNonLocked}"></g:checkBox>
                                </td>
                            </tr>

                           

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="credentialsNonExpired">Credentials Non Expired:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'credentialsNonExpired','errors')}">
                                    <g:checkBox name="credentialsNonExpired" value="${userInstance?.credentialsNonExpired}"></g:checkBox>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled">Enabled:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'enabled','errors')}">
                                    <g:checkBox name="enabled" value="${userInstance?.enabled}"></g:checkBox>
                                </td>
                            </tr>

-->
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
