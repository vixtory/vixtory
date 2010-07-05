<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
<head>
 <title><g:message code="version.vixtoryVersion" /></title>
<meta name="layout" content="main" />
<style type="text/css">
@import url(${createLinkTo(dir:'css',file:'form.css')});
</style>
<script type="text/javascript">
	// function for confirming the opening of the project 
	function confirmOpening() {
		if (document.getElementById("statusSelect").options[0].selected == true)
			return confirm("This action will open the project, are you sure you want to do this?");
	}

</script>
</head>
<body>
	<h1><g:message code="version.addNewVersion" /></h1>

	<g:form url="[action:'save',controller:'version']" method="post">
        <g:render template="/version/editform" model="['inputValue':'addVersion']" />
	</g:form>
</body></html>
