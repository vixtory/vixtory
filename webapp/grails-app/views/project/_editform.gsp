<g:hasErrors bean="${project}">
    <div class="errorMessage"><g:message code="project.save.errors" /></div>
</g:hasErrors>

<table border="0" class="edit">
    <tr>
        <th><label for="name"><g:message code="project.projectName" />:<em class="red">*</em></label></th>
        <td width="320">
            <input class='${hasErrors(bean:project,field:'name','errors')}' type="text" id="name" name="name" value="${project?.name}" />
        </td>
        <td>
            <g:eachError bean="${project}" field="name">
            <span class="fieldError"><g:message error="${it}" /></span>
            </g:eachError>
        </td>
    </tr>

    <tr>
        <th><label for="description"><g:message code="common.description" />:<em class="red">*</em></label></th>
        <td><textarea class='${hasErrors(bean:project,field:'description','errors')}' name="description" rows="5" cols="40">${project?.description}</textarea></td>
        <td>
            <g:eachError bean="${project}" field="description">
            <span class="fieldError"><g:message error="${it}" /></span>
            </g:eachError>
        </td>
    </tr>
    <tr>
        <th><label for="managers"><g:message code="common.managers" />:<em class="red">*</em></label></th>
        <td>
            <vixtory:selectMultiple from="${users}" name="managers" optionKey="id" optionValue="userRealName" value="${selectedManagers}"/>
        </td>
        <td>
            <g:eachError bean="${project}" field="managers">
                <span class="fieldError"><g:message error="${it}" /></span>
            </g:eachError>
        </td>
    </tr>


	<g:if test="${inputValue != 'addProject'}">
    <tr>
        <th><label for="status"><g:message code="common.status" />:</label></th>
        <td>
            <g:select
                    from="${WorkStatus.values()}"
                    optionValue="${{message(code: it.translationKey)}}"
                    name="status"
                    id="status"
                    value="${project?.status}" />
        </td>
        <td>
            <g:eachError bean="${project}" field="status">
            <span class="fieldError"><g:message error="${it}" /></span>
            </g:eachError>
        </td>
    </tr>
	</g:if>
    <tr>
        <td>&nbsp;</td>
        <td>
            <input type="submit" name="submit" value="${message(code:"project.$inputValue")}" style="width: auto" onClick="return confirmClosing();" />
        </td>
    </tr>
 </table>
