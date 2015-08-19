<g:if test="${contactInstance?.phones}">
    <g:hiddenField id='phones-length' name='phones-length' value='${contactInstance?.phones.size()}'/>
    <table id="phone-table">
        <thead>
        <tr>

            <th><g:message code="phone.label" /></th>

            <g:sortableColumn property="phoneType" title="${message(code: 'phone.phoneType.label', default: 'Phone Type')}" />

            <g:sortableColumn property="userComment" title="${message(code: 'phone.userComment.label', default: 'User Comment')}" />

            <th></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${contactInstance?.phones}" status="i" var="phoneInstance">
            <tr>
                <td>
                    <input type="hidden" name="index" value="${i}">
                    <g:hiddenField id='phones-${i}-id' name='phones[${i}].id' value='${phoneInstance?.id}'/>
                    <g:hiddenField id='phones-${i}-deleted' name='phones[${i}].deleted' value='${phoneInstance?.deleted}'/>
                    <g:hiddenField id='phones-${i}-countryCode' name='phones[${i}].countryCode' value='${phoneInstance?.countryCode}'/>
                    <g:hiddenField id='phones-${i}-operatorCode' name='phones[${i}].operatorCode' value='${phoneInstance?.operatorCode}'/>
                    <g:hiddenField id='phones-${i}-basicNumber' name='phones[${i}].basicNumber' value='${phoneInstance?.basicNumber}'/>
                    <g:hiddenField id='phones-${i}-phoneType' name='phones[${i}].phoneType' value='${phoneInstance?.phoneType}'/>
                    <g:hiddenField id='phones-${i}-userComment' name='phones[${i}].userComment' value='${phoneInstance?.userComment}'/>
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

                <td>
                    <g:if test="${actionName=='edit'}">
                        <input type="button" name="phoneDelete" value="<g:message code="default.button.delete.label" default="Delete" />" id="phone-delete-btn" />
                    </g:if>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>