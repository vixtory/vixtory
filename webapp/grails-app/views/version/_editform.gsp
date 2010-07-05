<g:if test="${flash.error}">
	<div class="errorMessage">
		${flash.error}
	</div>
</g:if>
<g:else>
	<g:hasErrors bean="${version}">
	<div class="errorMessage">
		<g:message code="version.save.errors" />
	</div>
	</g:hasErrors>
</g:else>

<input type="hidden" name="projectId" id="projectId" value="${projectId}" />
<input type="hidden" name="referedSite" id="referedSite" value="${referedSite}" />

<table border="0" class="edit">
    <tr>
        <th><label for="versionNumber"><g:message code="version.versionNumber" />: <em class="red">*</em></label></th>
        <td width="320">
        	
            <input class="${hasErrors(bean:version,field:'versionNumber','errors')}" type="text" id="versionNumber" name="versionNumber" value="${version?.versionNumber}" />
           
        </td>
        <td>
            <g:eachError bean="${version}" field="versionNumber">
            <span class="fieldError"><g:message error="${it}" /></span>
            </g:eachError>
        </td>
    </tr>

    <tr>
        <th><label for="shortName"><g:message code="version.shortName" />:<em class="red">*</em></label></th>
        <td width="320">
        
        <input class="${hasErrors(bean:version,field:'shortName','errors')}" type="text" id="shortName" name="shortName" value="${version?.shortName}" />
        
        </td>
        <td>
            <g:eachError bean="${version}" field="shortName">
            <span class="fieldError"><g:message error="${it}" /></span>
            </g:eachError>
        </td>
    </tr>

    <tr>
        <th><label for="description"><g:message code="common.description" />:<em class="red">*</em></label></th>
        <td>
        
        <textarea class="${hasErrors(bean:version,field:'description','errors')}" name="description" rows="5" cols="40">${version?.description}</textarea>
       
        </td>
        <td>
            <g:eachError bean="${version}" field="description">
            <span class="fieldError"><g:message error="${it}" /></span>
            </g:eachError>
        </td>
    </tr>

    <tr>
        <th><label for="url"><g:message code="version.url" />:<em class="red">*</em></label></th>
        <td width="320">
        
        <input class="${hasErrors(bean:version,field:'url','errors')}" type="text" id="url" name="url" value="${version?.url}" />
       
        </td>
        <td>
            <g:eachError bean="${version}" field="url">
            <span class="fieldError"><g:message error="${it}" /></span>
            </g:eachError>
        </td>
    </tr>

    <tr>
        <th><label for="status"><g:message code="common.status" />:<em class="red">*</em></label></th>
        <td>
       
            <g:select
                    from="${WorkStatus.values()}"
                    optionValue="${{message(code: it.translationKey)}}"
                    name="status"
                    id="status"
                    value="${version?.status}" />
       
        </td>
        <td>
            <g:eachError bean="${version}" field="status">
            <span class="fieldError"><g:message error="${it}" /></span>
            </g:eachError>
        </td>
    </tr>
    <tr>
    	<th><label for="iframe_size"><g:message code="version.iframe" />:<em class="red">*</em></label></th>
    	
    	<td><g:if test="${inputValue != 'addVersion'}">
	    		<div>${version.iframe.size}
	    		</div>
    		</g:if>
    		<g:else>
	    		<g:select 
				name="iframe" 
				id="iframe"
				from="${Iframe.values()}" 
				optionValue="${{message(code: it.size)}}"
				value="${version?.iframe}"/>
    		</g:else>
    	</td>
    	 <td>
         <g:eachError bean="${version}" field="iframe">
         <span class="fieldError"><g:message error="${it}" /></span>
         </g:eachError>
     </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <input type="submit" name="submit" value="${message(code:"version.$inputValue")}" style="width: auto"
            <%-- we only print the function - call if the project status is closed --%>
        	<g:if test="${projectStatus == 'Closed'}">
            	onClick="return confirmOpening();compareUrls(${version?.status});"
		    </g:if>
			 <%-- else we only check if the url is changed --%>
		    <g:else>
			    onClick="compareUrls('${version?.url}');"
		    </g:else>
            />
        </td>
    </tr>
</table>
