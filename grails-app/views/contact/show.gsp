
<%@ page import="manual.Contact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contact" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contact">
			
				<g:if test="${contactInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="contact.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${contactInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="contact.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${contactInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="contact.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${contactInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="contact.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate format="yyyy-MM-dd"date="${contactInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.citizenship}">
				<li class="fieldcontain">
					<span id="citizenship-label" class="property-label"><g:message code="contact.citizenship.label" default="Citizenship" /></span>
					
						<span class="property-value" aria-labelledby="citizenship-label"><g:fieldValue bean="${contactInstance}" field="citizenship"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.website}">
				<li class="fieldcontain">
					<span id="website-label" class="property-label"><g:message code="contact.website.label" default="Website" /></span>
					
						<span class="property-value" aria-labelledby="website-label"><g:fieldValue bean="${contactInstance}" field="website"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="contact.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${contactInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="contact.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:fieldValue bean="${contactInstance}" field="company"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="contact.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${contactInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.maritalStatus}">
				<li class="fieldcontain">
					<span id="maritalStatus-label" class="property-label"><g:message code="contact.maritalStatus.label" default="Marital Status" /></span>
					
						<span class="property-value" aria-labelledby="maritalStatus-label"><g:fieldValue bean="${contactInstance}" field="maritalStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="contact.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${contactInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.town}">
				<li class="fieldcontain">
					<span id="town-label" class="property-label"><g:message code="contact.town.label" default="Town" /></span>
					
						<span class="property-value" aria-labelledby="town-label"><g:fieldValue bean="${contactInstance}" field="town"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="contact.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${contactInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.zipcode}">
				<li class="fieldcontain">
					<span id="zipcode-label" class="property-label"><g:message code="contact.zipcode.label" default="Zipcode" /></span>
					
						<span class="property-value" aria-labelledby="zipcode-label"><g:fieldValue bean="${contactInstance}" field="zipcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.attachments}">
				<li class="fieldcontain">
					<span id="attachments-label" class="property-label"><g:message code="contact.attachments.label" default="Attachments" /></span>
                    <div class="addition-table">
                        <g:render template="/layouts/attachlist" />
                    </div>
						%{--<g:each in="${contactInstance.attachments}" var="a">--}%
						%{--<span class="property-value" aria-labelledby="attachments-label"><g:link controller="attachment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="contact.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:fieldValue bean="${contactInstance}" field="image"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.phones}">
				<li class="fieldcontain">
					<span id="phones-label" class="property-label"><g:message code="contact.phones.label" default="Phones" /></span>
                    <div class="addition-table">
                        <g:render template="/layouts/phonelist" />
                    </div>
						%{--<g:each in="${contactInstance.phones}" var="p">--}%
						%{--<span class="property-value" aria-labelledby="phones-label"><g:link controller="phone" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:contactInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${contactInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
