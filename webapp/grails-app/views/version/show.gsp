<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">

<head>
	<title><g:message code="common.vixtory" /></title>
    <g:javascript library="jquery" />
    <g:javascript src="application.js" />
    <g:javascript src="scripts.js" />
	<g:javascript src="drag.js" />
    <g:javascript src="version_show.js" />
    <g:javascript src="jquery/ui.core.js" />
    <g:javascript src="jquery/ui.draggable.js" />
    <g:javascript src="jquery/ui.droppable.js" />

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />
	<meta http-equiv="Pragma" content="no-cache">
	<meta name="layout" content="vixtory" />

	
</head>

<body>

 <form>
   <input type="hidden" id="contextpath" value="${request.getContextPath()}"/>
   <input type="hidden" id="listReqs" value="<g:createLink controller='requirement' action='list' id='${version.id}' />"/>
   <input type="hidden" id="version" value="${version.id}"/>
   <input type="hidden" class="title" id="title" value="${currentURL}"/>
  <input type="hidden" value="${session['activeUser']}" id="currsess"/>
  <input type="hidden" value="<g:loggedInUserInfo field='userRealName'/>" id="userRealName"/>
 </form>

<div id="rManagement" class="rManagement" >
     <g:link style="color: white" controller="project" action="show" id="${version.id}">
     <g:message code="req.toolview" />
     </g:link>
    |
    <g:link style="color: white" controller="view" action="requirements" id="${view?.id}" params="[v:version.id]">
    <u><g:message code="req.managecurrent" /></u>
    </g:link>
    |
    <g:link style="color: white" controller="version" action="versionreqs" id="${version.id}">
    <u><g:message code="req.listofpages" /></u>
    </g:link>

</div>



<div class="toolBar" style="cursor: move;" name="toolBar" id="toolBar">
  <div id="links" style="text-align:center; padding-top:10px;width:50px">
    <img onclick="addRequirement();" style="margin-left:13px;cursor:pointer" src="${createLinkTo(dir:'images', file:'add.png')}" /><br/>
    <a id="showall" name="showall" class="showall" href="#"><img style="margin: 5px 0 0 9px;" src="${createLinkTo(dir:'images', file:'show_all.png')}" border="0"/></a><br/>
    <a id="hideall" name="hideall" class="showall" href="#" style="display:none"><img style="margin: 5px 0 0 9px;" src="${createLinkTo(dir:'images', file:'hide_all.png')}" border="0"/></a><br/>
    <g:link controller="project" action="list" ><img style="margin: 5px 0 0 15px;" src="${createLinkTo(dir:'images', file:'home.png')}" border="0" /></g:link>
  </div>
</div>



<div id="frameContainer" style="width:${version.iframe.size};">


	<div id="iframe" style="width:${version.iframe.size};float:left;position:relative;">
	<div id="spinner" class="iframeSpinner" style="display:none;filter:alpha(opacity=80);"><img style="margin-top:300px;margin-bottom:250px;" src="${createLinkTo(dir:'images', file:'indicator_big.gif')}" alt="spinner" /></div>
	 <!-- <iframe id="projectPage" name="projectPage" src="${createLinkTo(dir:'proxy', file:'index.html')}"> -->
		<!-- <iframe id="projectPage" name="projectPage" src="${request.getContextPath()}/proxy/load?url=${version.url}" -->
        	<iframe id="projectPage" name="projectPage" src="${request.getContextPath()}/proxy/load?url=${currentURL}"
		height="0" width="100%" frameborder="0" scrolling="yes">
		<g:message code="requirement.iframes" />.
	</iframe>
		
	</div>
</div>
<div id="requirements">

</div>
<script type="text/javascript">

<%-- Fetch requirements for this view --%>
        

<%-- Get new content for iframe through the proxy --%>
		function fetch(url) {
        var ajaxurl = "<g:createLink controller="proxy" action="load" id="${version.id}" />?url="+url;
              jQuery.ajax(
                      {
                       url: ajaxurl,
                       success: function(html) {
                              jQuery('#title').html(html);
                              reloadIframe();
                              }
                       });
		}

<%-- Get new content for iframe through the proxy. Used when sending forms. --%>
		function fetchPost(target, url) {
        var ajaxurl = "<g:createLink controller="proxy" action="load" id="${version.id}" />?url="+ url;
        jQuery('#title').load(ajaxurl, jQuery('#'+target).serialize(), function(e){reloadIframe();});
			return false;
		}

        function stop(e) {
			ddEnabled = false;

			if (draggedElement)
				draggedElement.style.opacity = 1;


              jQuery.ajax(
                      {
                       url: '${request.getContextPath()}/requirement/'+draggedElement.id.split("-")[1]+'/${version.id}/changeReq?x='+ draggedElement.style.left.split("px")[0] +'&y=' + draggedElement.style.top.split("px")[0],
                       success: function(html) {
                              jQuery('#requirements').html(html);
                              }
                       }             
                );
			enableSelecting();
		}

        </script>
<g:render template="/version/dialog" />
</body>
</html>
