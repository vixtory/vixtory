<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
<head>
 <title><g:message code="project.agileEditProject" /></title>
<meta name="layout" content="main" />
<style type="text/css">
@import url(${createLinkTo(dir:'css',file:'form.css')});
</style>
<g:javascript library="jquery" />
<g:javascript src="project_confirm_closing.js" />
</head>
<body>
	<h1><g:message code="project.editProject" /></h1>

	<g:form url="[action:'update',controller:'project']" method="post">
		<input type="hidden" name="id" value="${project?.id}" />
        <g:render template="/project/editform" model="['inputValue':'saveChanges']" />
	</g:form>
</body>
</html>
