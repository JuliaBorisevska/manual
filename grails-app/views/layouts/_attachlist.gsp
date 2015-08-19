<g:if test="${contactInstance?.attachments}">
    <g:hiddenField id='attach-length' name='attach-length' value='${contactInstance?.attachments.size()}'/>
    <table id="attach-table">
        <thead>
        <tr>

            <g:sortableColumn property="title" title="${message(code: 'attachment.title.label', default: 'Title')}" />

            <g:sortableColumn property="uploads" title="${message(code: 'attachment.uploads.label', default: 'Uploads')}" />

            <g:sortableColumn property="userComment" title="${message(code: 'attachment.userComment.label', default: 'User Comment')}" />

            %{--<g:sortableColumn property="path" title="${message(code: 'attachment.path.label', default: 'Path')}" />--}%

            <th></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${contactInstance?.attachments}" status="i" var="attachmentInstance">
            <tr>
                <td>
                    <input type="hidden" name="attIndex" value="${i}">
                    <g:hiddenField id='attachments-${i}-id' name='attachments[${i}].id' value='${attachmentInstance?.id}'/>
                    <g:hiddenField id='attachments-${i}-deleted' name='attachments[${i}].deleted' value='${attachmentInstance?.deleted}'/>
                    <g:hiddenField id='attachments-${i}-title' name='attachments[${i}].title' value='${attachmentInstance?.title}'/>
                    <g:hiddenField id='attachments-${i}-uploads' name='attachments[${i}].uploads' value='${attachmentInstance?.uploads}'/>
                    <g:hiddenField id='attachments-${i}-userComment' name='attachments[${i}].userComment' value='${attachmentInstance?.userComment}'/>
                    <g:hiddenField id='attachments-${i}-contact' name='attachments[${i}].contact.id' value='${attachmentInstance?.contact?.id}'/>
                    <g:if test="${actionName=='edit'}">
                        <a name="edit" class="popup-link-2" href="">
                            ${fieldValue(bean: attachmentInstance, field: "title")}
                        </a>
                    </g:if>
                    <g:if test="${actionName!='edit'}">
                        ${fieldValue(bean: attachmentInstance, field: "title")}
                    </g:if>
                </td>

                <td><g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${attachmentInstance.uploads}" /></td>

                <td>${fieldValue(bean: attachmentInstance, field: "userComment")}</td>

                %{--<td>${fieldValue(bean: attachmentInstance, field: "path")}</td>--}%

                <td>
                    <g:if test="${actionName=='edit'}">
                        <input type="button" name="attachDelete" value="<g:message code="default.button.delete.label" default="Delete" />" id="attach-delete-btn" />
                    </g:if>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>