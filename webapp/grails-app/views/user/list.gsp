

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>User List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
        </div>
        <div class="body">
            <h1>User List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
         

                   	        <g:sortableColumn property="userRealName" title="User Real Name" />
                        
                   	        <g:sortableColumn property="username" title="Username" />

                              <g:sortableColumn property="roles" title="Roles" />
                        
                   	        <!-- <g:sortableColumn property="accountNonExpired" title="Account Non Expired" /> -->
                        
                   	        <!-- <g:sortableColumn property="accountNonLocked" title="Account Non Locked" /> -->

  <g:sortableColumn property="accountNonLocked" title="tools" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean:userInstance, field:'id')}</g:link></td>
                        
                      
                        
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean:userInstance, field:'userRealName')}</g:link></td>

                        
                            <td>${fieldValue(bean:userInstance, field:'username')}</td>

                             <td>     <g:each var="r" in="${userInstance.roles}">
                                    ${r?.encodeAsHTML()}
                                </g:each>
                                </td>
                        
                          <!--  <td>${fieldValue(bean:userInstance, field:'accountNonExpired')}</td> -->
                        
                         <!--  <td>${fieldValue(bean:userInstance, field:'accountNonLocked')}</td> -->

   <td><g:link action="changepwd" id="${userInstance.id}">Change Password</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
