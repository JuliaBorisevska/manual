<div class="popup-box" id="popup-box-2">
    <div class="close">X</div>
    <div class="top">
        <h2><g:message code="attachment.popup.title"/></h2>
    </div>
    <div class="bottom">

        <input type="hidden" id="attachOperation" value="" >

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
            <g:textArea name="userComment" cols="40" rows="5" value=""/>

        </div>

        <div class="fieldcontain required">
            <label for="path">
                <g:message code="attachment.path.label" default="Path" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="path" required="" value=""/>

        </div>

    </div>
</div>