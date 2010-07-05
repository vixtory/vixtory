<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
<head>
 <title><g:message code="project.agileAddProject" /></title>
<meta name="layout" content="main" />
</head>
<style type="text/css">
@import url(${createLinkTo(dir:'css',file:'form.css')});
</style>
<script type="text/javascript">
	
	// function for confirming the closing of the project 
	function confirmClosing() {
		
		if (document.getElementById("statusSelect") && document.getElementById("statusSelect").options[1].selected == true)
			return confirm("This action will also close all open versions, are you sure you want to do this?");
		
	}
		
</script>
<body>
	<h1><g:message code="project.newProject" /></h1>

    <g:form url="[action:'save',controller:'project']" method="post">
    
        <g:render template="/project/editform" model="['inputValue':'addProject']" />
	</g:form>
</body>
</html>
