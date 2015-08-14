<g:if test="${contactInstance?.phones}">
    <table id="phone-table">
        <thead>
        <tr>

            <th><g:message code="phone.label" /></th>

            <g:sortableColumn property="phoneType" title="${message(code: 'phone.phoneType.label', default: 'Phone Type')}" />

            <g:sortableColumn property="userComment" title="${message(code: 'phone.userComment.label', default: 'User Comment')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${contactInstance?.phones}" status="i" var="phoneInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    <g:if test="${actionName=='edit'}">
                        <a name="edit" class="popup-link-1" href="">
                            +${fieldValue(bean: phoneInstance, field: "countryCode")} (${fieldValue(bean: phoneInstance, field: "operatorCode")}) ${fieldValue(bean: phoneInstance, field: "basicNumber")}
                        </a>
                    </g:if>
                    <g:if test="${actionName!='edit'}">
                        +${fieldValue(bean: phoneInstance, field: "countryCode")} (${fieldValue(bean: phoneInstance, field: "operatorCode")}) ${fieldValue(bean: phoneInstance, field: "basicNumber")}
                    </g:if>
                </td>
                <td>${fieldValue(bean: phoneInstance, field: "phoneType")}</td>

                <td>${fieldValue(bean: phoneInstance, field: "userComment")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>