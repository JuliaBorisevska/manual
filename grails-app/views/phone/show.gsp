
<%@ page import="manual.Phone" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'phone.label', default: 'Phone')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-phone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-phone" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list phone">
			
				<g:if test="${phoneInstance?.countryCode}">
				<li class="fieldcontain">
					<span id="countryCode-label" class="property-label"><g:message code="phone.countryCode.label" default="Country Code" /></span>
					
						<span class="property-value" aria-labelledby="countryCode-label"><g:fieldValue bean="${phoneInstance}" field="countryCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phoneInstance?.operatorCode}">
				<li class="fieldcontain">
					<span id="operatorCode-label" class="property-label"><g:message code="phone.operatorCode.label" default="Operator Code" /></span>
					
						<span class="property-value" aria-labelledby="operatorCode-label"><g:fieldValue bean="${phoneInstance}" field="operatorCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phoneInstance?.basicNumber}">
				<li class="fieldcontain">
					<span id="basicNumber-label" class="property-label"><g:message code="phone.basicNumber.label" default="Basic Number" /></span>
					
						<span class="property-value" aria-labelledby="basicNumber-label"><g:fieldValue bean="${phoneInstance}" field="basicNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phoneInstance?.phoneType}">
				<li class="fieldcontain">
					<span id="phoneType-label" class="property-label"><g:message code="phone.phoneType.label" default="Phone Type" /></span>
					
						<span class="property-value" aria-labelledby="phoneType-label"><g:fieldValue bean="${phoneInstance}" field="phoneType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phoneInstance?.userComment}">
				<li class="fieldcontain">
					<span id="userComment-label" class="property-label"><g:message code="phone.userComment.label" default="User Comment" /></span>
					
						<span class="property-value" aria-labelledby="userComment-label"><g:fieldValue bean="${phoneInstance}" field="userComment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phoneInstance?.contact}">
				<li class="fieldcontain">
					<span id="contact-label" class="property-label"><g:message code="phone.contact.label" default="Contact" /></span>
					
						<span class="property-value" aria-labelledby="contact-label"><g:link controller="contact" action="show" id="${phoneInstance?.contact?.id}">${phoneInstance?.contact?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:phoneInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${phoneInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
