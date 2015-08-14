<%@ page import="manual.Attachment" %>



<div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="attachment.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="30" required="" value="${attachmentInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'uploads', 'error')} required">
	<label for="uploads">
		<g:message code="attachment.uploads.label" default="Uploads" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="uploads" precision="day"  value="${attachmentInstance?.uploads}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'userComment', 'error')} ">
	<label for="userComment">
		<g:message code="attachment.userComment.label" default="User Comment" />
		
	</label>
	<g:textArea name="userComment" cols="40" rows="5" value="${attachmentInstance?.userComment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="attachment.contact.label" default="Contact" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contact" name="contact.id" from="${manual.Contact.list()}" optionKey="id" required="" value="${attachmentInstance?.contact?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'path', 'error')} required">
	<label for="path">
		<g:message code="attachment.path.label" default="Path" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="path" required="" value="${attachmentInstance?.path}"/>

</div>

