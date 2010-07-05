<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
<html>
<head>
<title><g:message code="project.projects" /></title>
<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'vixstyle.css')}">


<g:javascript library="jquery" />
<g:javascript src="project_list.js" />
<g:javascript src="scripts.js" />
<meta name="layout" content="main" />
</head>
<body>
<input type="hidden" id="contextpath" value="${request.getContextPath()}"/>
<g:link controller="project" action="add" class="projListLink"><g:message code="project.addNewProject" /></g:link>
|
<g:if test="${!status || status=='open'}">
<g:link controller="project" action="list" class="projListLink" params="['status':'closed']"><u><g:message code="project.closedprojects"/></u></g:link>
<h1><g:message code="project.inprogress" /></h1>
</g:if>
<g:else>
 <g:link controller="project" action="list" class="projListLink" params="['status':'open']"><u><g:message code="project.inprogress"/></u></g:link>
 <h1><g:message code="project.closedprojects" /></h1>
</g:else>




<div id="message"></div>
<div id="error"></div>
<g:if test="${flash.message}">
<div class="message">${flash.message}</div>
</g:if>

<!--
<div>

   <label for="projStatus"><g:message code="project.selectProjects" /></label><br />
        <g:select
            from="${WorkStatus.values()}"
            optionValue="${{message(code: it.translationKey)}}"
            name="selectOrder"
            id="selectOrder"
            value="${currentOrder}"
            noSelection="${['':message(code: 'common.all')]}"
            onChange="javascript:change(this)"/>
            
</div>
-->






<table class="projects" cellspacing="0px">
	<thead>
		<tr>
			<th class="plusMinusCell"></th>
			<th class="projectCell"><g:message code="project.project" /></th>
			<th><g:message code="common.manager" /></th>
			<th colspan="2"><g:message code="common.description" /></th>
		</tr>
	</thead>
	<tbody>
	<g:each in="${projects}" var="project" status="i">


    	<tr id="project${project.id}" >
    		<td rowspan="2" id="sizeChange${project.id}" class="plusminus">
    		<a href="javascript:expandProject(${project.id})" class="noDecoration">+</a>
    		</td>

    		<td class="topline">
    		<%-- The link to the latest version --%>
			<%-- if projects status is closed, we print popup -confirmation --%>
            <g:if test="${project.status != WorkStatus.CLOSED}">

                <%--Show project's name --%>
                <g:link controller="project" action="show" id="${project.id}" class="projListLink">${project.name}</g:link>
            </g:if>
            <g:else>
            	<g:link onClick="return confirmProjectOpen();" controller="project" action="show" id="${project.id}" class="projListLink">${project.name}</g:link>
            </g:else>

               </td>

    		<td class="topline">
    		   <g:each in="${project.managers}" var="manager">
    		     ${manager.userRealName}  <br />
    		   </g:each>
    		</td>
    		
    		
    		

    		<td class="topline">
    		  ${project.description}
                </td>
            

		<td class="topline">
                    <p class="right"><g:link controller="project" action="edit" id="${project.id}" class="projListLink"><g:message code="common.edit" /></g:link>
                        &emsp;
    			<span class="deleteProject" id="${project.id}" style="color:#666;text-decoration:underline;cursor:pointer"><g:message code="common.delete" /></span>
                        &emsp;
    			<g:link controller="version" action="versionreqs" id="${project.id}" style="color:#666"> <g:message code="common.manageRequirements" /></g:link>
		</p>
    		</td>
    	</tr>
    	
    	<tr>
            <td colspan="4">

    		<%-- Here we list the versions. It's hidden as a default. --%>
    		<div id="versionList${project.id}" style="display: none;">
    		   <p class="dotline">
                           <strong><g:message code="common.versions" /></strong>
                           &emsp;
                           <g:link controller="version" action="add" params="[projectId: project.id]" class="projListLink"><g:message code="common.addNewVersion" /></g:link>
                   </p>

                   <g:if test="${!project.versions}">
                         <g:message code="project.hasNoVersions" />
                   </g:if>
                   

                   <table class="mini">
                   <g:each in="${project.versions}" var="version">
                    <tr id="project${project.id}version${version.id}">
                    <td>            
                              <%-- if versions status is closed, we print popup -confirmation --%>
                              
                              <g:if test="${version.status != WorkStatus.CLOSED}">
                                 <g:link controller="version" action="show" id="${version.id}" class="projListLink">${version.versionNumber}</g:link>
                              </g:if>
                              <g:else>
                                  <g:link onClick="return confirmVersionOpen();" controller="version" action="show" id="${version.id}" class="projListLink">${version.versionNumber}</g:link>
                              </g:else>
                              </td>
                              <td>
                              <g:message code="${version.status.translationKey}"/>
                              </td>
                              <td>
                              <g:link controller="version" action="edit" params="[versionId:version.id, projectId:project.id]" class="projListLink"><g:message code="common.edit" /></g:link>
                              </td>
                              <td>
                              <span class="deleteVersion" id="${project.id}-${version.id}" style="color:#666;text-decoration:underline;cursor:pointer"><g:message code="common.delete" /></span>
                              </td>
                              <td>  
                              <g:link controller="version" action="versionreqs" id="${version.id}" style="color:#666;text-decoration:underline;cursor:pointer"> <u><g:message code="common.manageRequirements" /></u></g:link>
                   </td>
                   </tr>           
                   </g:each>
                   
                   </table>
                   </div>
                   </td>           
                 </tr>
                           
                   



    		

	</g:each>
	</tbody>
</table>
<br />

</body>

</html>
