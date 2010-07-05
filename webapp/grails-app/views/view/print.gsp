<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
<head>
	<title><g:message code="common.vixtory" /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />
	<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'style.css')}">
	<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'main.css')}">
    <g:javascript library="jquery" />
    <g:javascript src="print.js" />
</head>

<body>
<script type="javascript">
  <!-- this function is for changing the zoomlevel --!>
		function setZoom(zoomLevel) {
			<!-- we change the zoomlevel for all the urls in the view --!>
			<g:each in="${views}" var="view" status="i">
				document.getElementById('projectPage${i}').style.zoom = zoomLevel;
			</g:each>
		}

		<!-- this function is for changing the font --!>
		function setFont(fontSize) {
			<!-- here we change the font-size for all the urls in the view --!>
			<g:each in="${views}" var="view" status="i">
				document.getElementById('requirementsParagraph${i}').style.fontSize = fontSize + "px";
			</g:each>
		}
      </script>


    <p style="padding-left: 10px; font-weight: bold; font-size: 14px; padding-top: 10px;">
		${project.name} ${version.versionNumber}
	</p>

    <%-- link back to the version controllers show -action --%>
    <g:link controller="version" class="projListLink" style="padding-left: 10px;" action="show" id="${version.id}"> <g:message code="common.back" /> </g:link>
    &nbsp;
    <a id="propertiesLink" title="Options" class="projListLink" onclick="toolBar();" href="#"><g:message code="common.properties" /></a>

    <p></p>

	<div id="toolBar" style="padding-left: 10px;"cellpadding=0 cellspacing=0></div>
    <table>
    <%-- here we list all of the pages in the requirements --%>
    <g:each in="${views}" var="view" status="i">
        <tr>
			<td style="vertical-align:top;">
                <%-- the iframes zoom -style attribute only works with internet explorer.
				we print the zoomLevel to the zoom-style. we use proxy, not the original page. --%>
               	<iframe name="projectPage${i}" id="projectPage${i}"
                    src="${request.getContextPath()}/proxy/load?url=${view.url}"
                    onload='setIframeHeight("projectPage${i}");'
               		frameborder="0" scrolling="no" style="width: 900px; height: 700px; zoom: ${zoomLevel}%">
               	<g:message code="common.iframes" />.
				</iframe>
			</td>
            <td style="vertical-align:top; padding-left: 5px;">
                <%-- link to the requirements view --%>
				<p><a class="projListLink" href="${createLink(url:[controller:'version', action:'show', id:version.id])}?url=${view.url}"><g:message code="common.edit" /></a></p>
				<%-- here we list all of the pages requirements --%>
                <p class="viewtext" id="requirementsParagraph${i}" style="font-size: ${fontSize}%">
		
                <g:each in="${Requirement.findAllByView(view,[sort:'priority',order:'asc'])}" var="requirement" status="j">

		     <g:if test="${requirement.status == RequirementStatus.OPEN}">
                   	<span style="font-weight: bold;">${version.shortName}-${requirement.id}:</span><br />
                   	<g:message code="common.title" />: ${requirement.title}<br />
                   	<g:message code="common.priority" />: ${requirement.priority}<br />
                   	<g:message code="common.status" />: ${requirement.status}<br />
                   	<g:message code="common.description" />: ${requirement.description}<br/>
                   	<g:message code="common.creator" />: ${requirement.creator}<br />
                        
                        <%-- Use the formatDate tag-library to output creation date in desired format :jukkah --%>
                        <g:message code="common.date" />: <g:formatDate date="${requirement.creationDate}" format="yyyy-MM-dd HH:mm:ss"/>
                        <br />
                        <br />
		      </g:if>
               </g:each>

		<br /><br />
                <g:each in="${Requirement.findAllByView(view,[sort:'priority',order:'asc'])}" var="requirement" status="j">

		     <g:if test="${requirement.status == RequirementStatus.RESOLVED}">
                   	<span style="text-decoration: line-through; font-weight: bold;">${version.shortName}-${requirement.id}:</span><br />
                   	<g:message code="common.title" />: ${requirement.title}<br />
                   	<g:message code="common.priority" />: ${requirement.priority}<br />
                   		<g:message code="common.status" />: ${requirement.status}<br />
                   		<g:message code="common.description" />: ${requirement.description}<br/>
                   		<g:message code="common.creator" />: ${requirement.creator}<br />
                        
                        <%-- Use the formatDate tag-library to output creation date in desired format :jukkah --%>
                        <g:message code="common.date" />: <g:formatDate date="${requirement.creationDate}" format="yyyy-MM-dd HH:mm:ss"/>
                        <br />
                        <br />
		      </g:if>
               </g:each>
                    </p>
                </td>
			</tr>
        <%-- we draw a line after every page --%>
        <tr><td colspan="2"><br /><hr></td></tr>
    </g:each>
    </table>

</body>
</html>
