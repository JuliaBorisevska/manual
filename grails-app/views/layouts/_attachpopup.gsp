<div class="popup-box" id="popup-box-2">
    <div class="close">X</div>
    <div class="top">
        <h2><g:message code="attachment.popup.title"/></h2>
    </div>
    <div class="bottom">

        <input type="hidden" id="attachOperation" value="" >
        <input type="hidden" id="attachIndex" value="" >
        <input type="hidden" id="attachRowNumber" value="" >

        <div class="fieldcontain required">
            <label for="title">
                <g:message code="attachment.title.label" default="Title" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="title" maxlength="30" required="" value=""/>

        </div>

        <div class="fieldcontain">
            <label for="userComment">
                <g:message code="attachment.userComment.label" default="User Comment" />

            </label>
            <g:textArea name="userComment" id="attach-userComment" cols="40" rows="5" value=""/>

        </div>

        <div class="fieldcontain required">
            <label for="path">
                <g:message code="attachment.path.label" default="Path" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="path" required="" value=""/>

        </div>

        <input type="button" name="save" value="<g:message code="button.save.label" default="Save" />" id="attach-save-btn" />

    </div>
</div>