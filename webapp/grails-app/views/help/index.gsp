<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
	<head>
		<title><g:message code="index.titleLogin" /></title>

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />
	<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'style.css')}">
	<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'help.css')}">
	<meta name="layout" content="main" />
</head>
<html>
	<head>
		<title><g:message code="index.titleUsersGuide" /></title>
	</head>

	<body>
		<div id="guide">
		<h1><g:message code="index.usersGuide" /></h1>
		<p>
			<g:message code="index.guideShortDescription" />
		</p>
		
		<!-- Ankkuri projektilistaukselle -->
		<a name="projectview"></a>
		
		<h2><g:message code="index.projectsVersions" /></h2>
		
		<p>
			<g:message code="index.projectListView" /> <a href="#addproject"><g:message code="index.addNewProjects" /> </a> <g:message code="index.and" /> <a href="#editproject"><g:message code="index.edit" /></a> <g:message code="index.or" /> <a href="#deleteproject"><g:message code="index.delete" /></a> <g:message code="index.generalInformation" /><a href="#requirementsview"><g:message code="common.requirementsView" /></a> <g:message code="index.andThe" /> <a href="#reportview"><g:message code="common.viewReport" /></a> <g:message code="index.showFunction" />
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'plist.jpg')}">
		
		<p>
			<g:message code="index.whenYouClick" /> <a href="#editversion"><g:message code="index.edit" /></a>, <a href="#deleteversion"><g:message code="index.delete" /></a> <g:message code="index.or" /> <a href="#addversion"><g:message code="index.addNewVersion" /></a>.
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'plist_open.jpg')}">
		
		<p>
			<h3><a name="addproject"><g:message code="index.addingNewProject" /></a></h3>
			<g:message code="index.toAddNewProject" />
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'add_p.jpg')}">
		
		<p>
			<h3><a name="editproject"><g:message code="index.editProject" /></a></h3>
			<g:message code="index.ifYouWish" /> 
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'edit_p.jpg')}">
		
		<p>
			<h3><a name="deleteproject"><g:message code="index.deleteProject" /></a></h3>
			<g:message code="index.toDelete" />
		</p>
		
		<p>
			<h3><a name="addversion"><g:message code="index.addVersion" /></a></h3>
			<g:message code="index.toAddVersion" />
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'add_v.jpg')}">
		
		<p>
			<h3><a name="editversion"><g:message code="index.editVersion" /></a></h3>
			<g:message code="index.ifYouWishEdit" /> 
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'edit_v.jpg')}">
				
		<p>
			<h3><a name="deleteversion"><g:message code="index.deleteVersion" /></a></h3>
			<g:message code="index.toDeleteVersion" />
		</p>		
		
		<!-- Ankkuri vaatimusn�kym�lle -->
		<a name="requirementsview"></a>
		
		<h2><g:message code="index.requirements" /></h2>
		<p>
			<g:message code="index.theRequirementsView" /> <a href="#addrequirement"><g:message code="index.attachDescriptions" /></a> <g:message code="index.toTheDifferentViews" /> <a href="#editrequirement"><g:message code="index.manage" /></a> <g:message code="index.themAsTheProject" />
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'req_v.jpg')}" />
		
		<p>
			<h3><a name="addrequirement"><g:message code="index.addRequirement" /></a></h3>
			<g:message code="index.newRequirements" />
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'add_r1.jpg')}"><br />
		<img src="${createLinkTo(dir:'images/help', file:'add_r2.jpg')}">
		
		<p>
			<h3><g:message code="index.viewRequirements" /></h3>
			<g:message code="index.requirementsInTheLeft" />
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'req_v2.jpg')}" />
		
		<p>
			<h3><a name="editrequirement"><g:message code="index.editRequirement" /></a></h3>
			<g:message code="index.descriptionOfIndividual" />
		</p>
		
		<p>
			<h3><g:message code="index.deletingResolving" /></h3>
			<g:message code="index.requirementsCanBeDeleted" />
		</p>
		
		<p>
			<h3><a name="reportview"><g:message code="index.reportView" /></a></h3>
			<g:message code="index.theReportView" />
			
		</p>
		<img src="${createLinkTo(dir:'images/help', file:'print_v2.jpg')}" />
		</div>
	</body>
</html>