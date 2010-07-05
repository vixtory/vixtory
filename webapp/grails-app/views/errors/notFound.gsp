<g:applyLayout name="main">

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
	<head>
		<title><g:message code="error.pageNotFound" /></title>

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />
	<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'style.css')}">

</head>
<body>
    <div>
        <!--<img id="vixtory-logo" src="${createLinkTo(dir:'images',file:'at_logo.png')}" alt="" class="logo" />-->
        <h2><g:message code="error.urlNotFound" /></h2>

        <p><g:message code="error.enterAddress" /><g:link controller="project"><g:message code="error.projects" /></g:link> <g:message code="error.page" />.</p>
    </div>
</body>

</g:applyLayout>