<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
    "http://www.w3.org/TR/REC-html40/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
<html>
 <head>
 	   <title><g:message code="reqpages.title" /></title>
       <link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'vixstyle.css')}">
       <meta name="layout" content="vixtory" />
 </head>

<body>
<p class="topwhite">
     <g:link style="color: white" controller="version" action="show" id="${version.id}">
     <u><g:message code="req.toolview" /></u>
     </g:link>
     |
     <g:link style="color: white" controller="view" action="requirements" id="${view?.id}" params="[v:version.id]">
     <u><g:message code="req.managecurrent" /></u>
     </g:link>
     |
     <g:link style="color: white" controller="version" action="versionreqs" id="${version.id}">
     <g:message code="req.listofpages" />
     </g:link>
</p>

      <h1>${project.name} [ ${version.shortName} ] - <g:message code="reqpages.title" /></h1>
      <p class="percents"><b> ${resolvedPercent}% </b><g:message code="reqpages.percentofrequirements" /> <b><g:message code="reqpages.resolved" /></b>.</p>

      <table>
      <tr>  
           <th></th>  
            <th></th>  
            <th><g:message code="reqpages.page" /></th>  
            <th><g:message code="reqpages.total" /></th>  
            <th><g:message code="reqpages.unresolved" /></th>  
            <th><g:message code="reqpages.resolved" /></th>
      </tr>
      <g:each in="${views}" var="view" status="i">
      	<tr>
        	   <td class="req"><u><g:link style="color: black" controller="version" action="show" id="${version.id}" params="[url:view.url]"> <g:message code="common.toolview" /> </g:link></u></td>
        	   <td class="req"><u><g:link style="color: black" controller="view" action="requirements" id="${view.id}" params="[v:version.id]"><g:message code="common.requirementmanagement" /></g:link></u></td>
        	   <td class="req"><g:link style="padding-left: 10px;color: black"  url="${view.url}"> ${view.url} </g:link> </td>
        	   <td class="req"> ${Requirement.countByView(view)}</td>
        	   <td class="req"> ${Requirement.countByViewAndStatus(view, RequirementStatus.OPEN)}</td>
        	   <td class="req"> ${Requirement.countByViewAndStatus(view, RequirementStatus.RESOLVED)}</td>
      	</tr>
      </g:each>
      </table>

   <br />
   <br />
</body>
</html>