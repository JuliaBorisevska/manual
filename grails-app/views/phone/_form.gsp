<%@ page import="manual.Phone" %>



<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'countryCode', 'error')} required">
	<label for="countryCode">
		<g:message code="phone.countryCode.label" default="Country Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="countryCode" type="number" value="${phoneInstance.countryCode}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'operatorCode', 'error')} required">
	<label for="operatorCode">
		<g:message code="phone.operatorCode.label" default="Operator Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="operatorCode" type="number" value="${phoneInstance.operatorCode}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'basicNumber', 'error')} required">
	<label for="basicNumber">
		<g:message code="phone.basicNumber.label" default="Basic Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="basicNumber" type="number" value="${phoneInstance.basicNumber}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'phoneType', 'error')} required">
	<label for="phoneType">
		<g:message code="phone.phoneType.label" default="Phone Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="phoneType" from="${phoneInstance.constraints.phoneType.inList}" required="" value="${phoneInstance?.phoneType}" valueMessagePrefix="phone.phoneType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'userComment', 'error')} ">
	<label for="userComment">
		<g:message code="phone.userComment.label" default="User Comment" />
		
	</label>
	<g:textArea name="userComment" cols="40" rows="5" value="${phoneInstance?.userComment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="phone.contact.label" default="Contact" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contact" name="contact.id" from="${manual.Contact.list()}" optionKey="id" required="" value="${phoneInstance?.contact?.id}" class="many-to-one"/>

</div>

