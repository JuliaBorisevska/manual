<div class="popup-box" id="popup-box-1">
    <div class="close">X</div>
    <div class="top">
        <h2><g:message code="phone.popup.title"/></h2>
    </div>
    <div class="bottom">

        <input type="hidden" id="phoneOperation" value="" >
        <input type="hidden" id="index" value="" >

        <div class="fieldcontain required">
            <label for="countryCode">
                <g:message code="phone.countryCode.label" default="Country Code" />
                <span class="required-indicator">*</span>
            </label>
            <g:field name="countryCode" type="number" value="" required=""/>

        </div>

        <div class="fieldcontain required">
            <label for="operatorCode">
                <g:message code="phone.operatorCode.label" default="Operator Code" />
                <span class="required-indicator">*</span>
            </label>
            <g:field name="operatorCode" type="number" value="" required=""/>

        </div>

        <div class="fieldcontain required">
            <label for="basicNumber">
                <g:message code="phone.basicNumber.label" default="Basic Number" />
                <span class="required-indicator">*</span>
            </label>
            <g:field name="basicNumber" type="number" value="" required=""/>

        </div>

        <div class="fieldcontain required">
            <label for="phoneType">
                <g:message code="phone.phoneType.label" default="Phone Type" />
                <span class="required-indicator">*</span>
            </label>
            <g:select name="phoneType" from="${manual.Phone.constraints.phoneType.inList}" required="" valueMessagePrefix="phone.phoneType"/>

        </div>

        <div class="fieldcontain ">
            <label for="userComment">
                <g:message code="phone.userComment.label" default="User Comment" />

            </label>
            <g:textArea name="userComment" cols="40" rows="5" value=""/>

        </div>

        <input type="button" name="save" value="<g:message code="button.save.label" default="Save" />" id="phone-save-btn" />

    </div>
</div>