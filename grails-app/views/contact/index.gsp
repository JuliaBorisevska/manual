
<%@ page import="manual.Contact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<a href="#list-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link action="stats"><g:message code="stats.label"/></g:link></li>
			</ul>
		</div>
		<div id="list-contact" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="lastName" title="${message(code: 'contact.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'contact.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'contact.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="dateOfBirth" title="${message(code: 'contact.dateOfBirth.label', default: 'Date Of Birth')}" />
					
						<g:sortableColumn property="citizenship" title="${message(code: 'contact.citizenship.label', default: 'Citizenship')}" />
					
						<g:sortableColumn property="website" title="${message(code: 'contact.website.label', default: 'Website')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactInstanceList}" status="i" var="contactInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "lastName")}</g:link></td>
					
						<td>${fieldValue(bean: contactInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "middleName")}</td>
					
						<td><g:formatDate format="yyyy-MM-dd" date="${contactInstance.dateOfBirth}" /></td>
					
						<td>${fieldValue(bean: contactInstance, field: "citizenship")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "website")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contactInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
