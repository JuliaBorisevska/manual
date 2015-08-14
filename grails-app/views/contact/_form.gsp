<%@ page import="manual.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="contact.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="30" required="" value="${contactInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="contact.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="30" required="" value="${contactInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="contact.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" maxlength="30" value="${contactInstance?.middleName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="contact.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${contactInstance?.dateOfBirth}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'citizenship', 'error')} ">
	<label for="citizenship">
		<g:message code="contact.citizenship.label" default="Citizenship" />
		
	</label>
	<g:textField name="citizenship" maxlength="50" value="${contactInstance?.citizenship}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="contact.website.label" default="Website" />
		
	</label>
	<g:field type="url" name="website" maxlength="30" value="${contactInstance?.website}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="contact.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${contactInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'company', 'error')} ">
	<label for="company">
		<g:message code="contact.company.label" default="Company" />
		
	</label>
	<g:textField name="company" maxlength="30" value="${contactInstance?.company}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="contact.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${contactInstance.constraints.gender.inList}" required="" value="${contactInstance?.gender}" valueMessagePrefix="contact.gender"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'maritalStatus', 'error')} required">
	<label for="maritalStatus">
		<g:message code="contact.maritalStatus.label" default="Marital Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="maritalStatus" from="${contactInstance.constraints.maritalStatus.inList}" required="" value="${contactInstance?.maritalStatus}" valueMessagePrefix="contact.maritalStatus"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="contact.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="country" maxlength="50" required="" value="${contactInstance?.country}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'town', 'error')} ">
	<label for="town">
		<g:message code="contact.town.label" default="Town" />
		
	</label>
	<g:textField name="town" maxlength="30" value="${contactInstance?.town}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="contact.address.label" default="Address" />
		
	</label>
	<g:textField name="address" maxlength="70" value="${contactInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'zipcode', 'error')} ">
	<label for="zipcode">
		<g:message code="contact.zipcode.label" default="Zipcode" />
		
	</label>
	<g:field name="zipcode" type="number" value="${contactInstance.zipcode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'image', 'error')} ">
    <label for="image">
        <g:message code="contact.image.label" default="Image" />
    </label>
    <g:textField name="image" value="${contactInstance?.image}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'attachments', 'error')} ">
	<label for="attachments">
		<g:message code="contact.attachments.label" default="Attachments" />
		
	</label>
	
<ul class="one-to-many">
    <g:render template="/layouts/attachlist" />
%{--<g:each in="${contactInstance?.attachments?}" var="a">--}%
    %{--<li><g:link controller="attachment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
<li class="add">
    %{--<g:link controller="attachment" action="create" params="['contact.id': contactInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'attachment.label', default: 'Attachment')])}</g:link>--}%
    <a name="add" class="popup-link-2" href="">
        ${message(code: 'default.add.label', args: [message(code: 'attachment.label', default: 'Attachment')])}
    </a>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'phones', 'error')} ">
	<label for="phones">
		<g:message code="contact.phones.label" default="Phones" />
		
	</label>
	
<ul class="one-to-many">
    <g:render template="/layouts/phonelist" />
%{--<g:each in="${contactInstance?.phones?}" var="p">--}%
    %{--<li><g:link controller="phone" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
<li class="add">
    %{--<g:link controller="phone" action="create" params="['contact.id': contactInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'phone.label', default: 'Phone')])}</g:link>--}%
    <a name="add" class="popup-link-1" href="">
        ${message(code: 'default.add.label', args: [message(code: 'phone.label', default: 'Phone')])}
    </a>
</li>
</ul>


</div>

