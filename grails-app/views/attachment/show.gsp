
<%@ page import="manual.Attachment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-attachment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="attachment.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-attachment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list attachment">
			
				<g:if test="${attachmentInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="attachment.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${attachmentInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attachmentInstance?.uploads}">
				<li class="fieldcontain">
					<span id="uploads-label" class="property-label"><g:message code="attachment.uploads.label" default="Uploads" /></span>
					
						<span class="property-value" aria-labelledby="uploads-label"><g:formatDate date="${attachmentInstance?.uploads}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${attachmentInstance?.userComment}">
				<li class="fieldcontain">
					<span id="userComment-label" class="property-label"><g:message code="attachment.userComment.label" default="User Comment" /></span>
					
						<span class="property-value" aria-labelledby="userComment-label"><g:fieldValue bean="${attachmentInstance}" field="userComment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attachmentInstance?.contact}">
				<li class="fieldcontain">
					<span id="contact-label" class="property-label"><g:message code="attachment.contact.label" default="Contact" /></span>
					
						<span class="property-value" aria-labelledby="contact-label"><g:link controller="contact" action="show" id="${attachmentInstance?.contact?.id}">${attachmentInstance?.contact?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${attachmentInstance?.path}">
				<li class="fieldcontain">
					<span id="path-label" class="property-label"><g:message code="attachment.path.label" default="Path" /></span>
					
						<span class="property-value" aria-labelledby="path-label"><g:fieldValue bean="${attachmentInstance}" field="path"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:attachmentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${attachmentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
