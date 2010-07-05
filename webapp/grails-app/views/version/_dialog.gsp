	<div id="dialog" class="addRequirementDialog" style="display:none;">
	
		<%-- a form whitch will be submitted as AJAX with the following parameters --%>
		<g:formRemote name="requirement"
		update="[success:'requirements', failure:'requirements']"
		action=""
		before="setSession(this.creator.value);"
		url="${[controller:'requirement',action:'reqAction',id:version.id]}"
		onComplete="checkErrors();">

			<h1 id="dialogTopic"></h1>


			<%-- the div to show the error-warning --%>
			<div id="dialogError" style="display:none; font-weight: bold; font-size: 120%;"><g:message code="requirement.errorRequirement" /><br /><br /></div>

			<%-- some hidden values will be inserted here.  --%>
			<div id="hiddenValues"></div>

			<%-- The action type what kind of action we use --%>
			<input type="hidden" id="actionType" name="actionType" value="" />

			<label for="creator"><g:message code="requirement.creator" />: <em class="red">*</em><span style="display:none; font-weight: bold;" id="creatorErrorValue"> <g:message code="requirement.creatorEmpty" />!</span></label>
            <span style="display:none; font-weight: bold;" id="creatorlengthErrorValue"> <g:message code="requirement.creatorTooLong" />!</span><br />
            <g:loggedInUserInfo field="userRealName"/><input type="hidden" name="creator" id="creator" value=" <g:loggedInUserInfo field='userRealName'/>" />
			
			<br />

			<label for="title"><g:message code="requirement.title" />: <em class="red">*</em><span style="display:none; font-weight: bold;" id="titleErrorValue"> <g:message code="requirement.titleEmpty" />!</span></label>
            <span style="display:none; font-weight: bold;" id="titlelengthErrorValue"> <g:message code="requirement.titleTooLong" /></span><br />
            <input type="text" name="title" id="smallTitle" />
			<br />

			<label for="description"><g:message code="common.description" /> <em class="red">*</em><span style="display:none; font-weight: bold;" id="descriptionErrorValue"><g:message code="requirement.descriptionEmpty" />!</span></label>
            <span style="display:none; font-weight: bold;" id="descriptionlengthErrorValue"><g:message code="requirement.descriptionTooLong"/>!</span><br />
            <textarea name="description" id="description"></textarea>
			<br />
			
			<label for="priority"><g:message code="requirement.priority" /><em class="red">*</em></label><br />

            <g:select
                from="${RequirementPriority.values()}"
                optionValue="${{message(code: it.translationKey)}}"
                name="priority"
                id="priority"
                value="${requirement?.priority}"/>
			<br />
			
			<input type="submit" value="${message(code:"common.save")}" />

			<input type="button" value="${message(code:"common.cancel")}" onclick="hideDialog();">
		</g:formRemote>
	</div>
