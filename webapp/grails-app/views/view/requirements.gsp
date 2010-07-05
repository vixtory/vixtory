<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
    "http://www.w3.org/TR/REC-html40/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
<html>
 <head>
    <g:javascript library="jquery" />
    <g:javascript src="requirements.js" />
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
     <g:message code="req.managecurrent" />
     </g:link>
     |
     <g:link style="color: white" controller="version" action="versionreqs" id="${version.id}">
     <u><g:message code="req.listofpages" /></u>
     </g:link>
</p>

      
      <h1><g:message code="reqs.title" /></h1>
      <div id="blueline"><p class="blue"><u></u></p></div>

      <h2><g:message code="reqs.unresolved" /></h2>

      <form id="reqForm">
      <table>
      <tr>  <th><input type="checkbox" id="selectall"  /></th>
            <th><g:message code="reqs.minititle" /></th>
            <th><g:message code="reqs.description" /></th>
            <th><g:message code="reqs.criticalness" /></th>
            <th><g:message code="reqs.creator" /></th>
            <th></th>
      </tr> 
      <g:each in="${Requirement.findAllByViewAndStatus(currentView, RequirementStatus.OPEN)}" var="requirement" status="j">
      <tr>
            <td class="req"><input type="checkbox" name="chosen" value="chosen"  /></td>
            <td class="req">${requirement.title}</td>  
            <td class="req">${requirement.description}</td>
            <g:if test="${requirement.priority == RequirementPriority.BLOCKER}">    
            	<td style="background-color:#FF9999" class="req">${requirement.priority}</td>
            </g:if>
            
            <g:elseif test="${requirement.priority == RequirementPriority.CRITICAL}">    
            	<td style="background-color:#FFFF99" class="req">${requirement.priority}</td>
            </g:elseif>
            
            <g:elseif test="${requirement.priority == RequirementPriority.MAJOR}">    
            	<td style="background-color:LightBlue" class="req">${requirement.priority}</td>
            </g:elseif>
            
            <g:elseif test="${requirement.priority == RequirementPriority.MINOR}">    
            	<td style="background-color:AliceBlue" class="req">${requirement.priority}</td>
            </g:elseif>
            
            <g:elseif test="${requirement.priority == RequirementPriority.TRIVIAL}">    
            	<td style="background-color:#CCFF99" class="req">${requirement.priority}</td>
            </g:elseif>
                           
            <g:else>    
            <td class="req">${requirement.priority}</td>
            </g:else>
            
            <td class="req">${requirement.creator}</td>    
            <td class="req"><u><g:link style="color: black" controller="version" action="show" id="${version.id}" params="[url:currentView.url]"><g:message code="reqs.edit" /> </g:link> 
      </tr>
      </g:each>
      </table>
      
      <div class="leftmargin">
      <input type="button" name="resolve" value="<g:message code="reqs.resolve" />">
      <input type="button" name="delete" value="<g:message code="reqs.delete" />">
      </div>
      </form>

      <br />
      <br />

      <h2><g:message code="reqs.resolved" /></h2>
      <form>
      <table>
      <tr>  <th><input type="checkbox" id="selectall2"  /></th>
            <th><g:message code="reqs.minititle" /></th>
            <th><g:message code="reqs.description" /></th>
            <th><g:message code="reqs.criticalness" /></th>
            <th><g:message code="reqs.creator" /></th>
      </tr>
      <g:each in="${Requirement.findAllByViewAndStatus(currentView, RequirementStatus.RESOLVED)}" var="requirement" status="j">
      <tr>
            <td class="req"><input type="checkbox" name="chosen2" value="chosen2"  /></td>
            <td>${requirement.title}</td>  
            <td class="req">${requirement.description}</td>    
 <g:if test="${requirement.priority == RequirementPriority.BLOCKER}">    
            	<td style="background-color:#FF9999" class="req">${requirement.priority}</td>
            </g:if>
            
            <g:elseif test="${requirement.priority == RequirementPriority.CRITICAL}">    
            	<td style="background-color:#FFFF99" class="req">${requirement.priority}</td>
            </g:elseif>
            
            <g:elseif test="${requirement.priority == RequirementPriority.MAJOR}">    
            	<td style="background-color:LightBlue" class="req">${requirement.priority}</td>
            </g:elseif>
            
            <g:elseif test="${requirement.priority == RequirementPriority.MINOR}">    
            	<td style="background-color:AliceBlue" class="req">${requirement.priority}</td>
            </g:elseif>
            
            <g:elseif test="${requirement.priority == RequirementPriority.TRIVIAL}">    
            	<td style="background-color:#CCFF99" class="req">${requirement.priority}</td>
            </g:elseif>
                           
            <g:else>    
            <td class="req">${requirement.priority}</td>
            </g:else>
            <td class="req">${requirement.creator}</td>    
      </tr>
      </g:each>
      </table>
      <div class="leftmargin">
      <input type="button" name="reopen" value="<g:message code="reqs.reopen" />">
      <input type="button" name="delete" value="<g:message code="reqs.delete" />">
      </div>
      </form>
      
      <br />
      <br />
</body>
</html>