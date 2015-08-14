<g:if test="${contactInstance?.attachments}">
    <table id="attach-table">
        <thead>
        <tr>

            <g:sortableColumn property="title" title="${message(code: 'attachment.title.label', default: 'Title')}" />

            <g:sortableColumn property="uploads" title="${message(code: 'attachment.uploads.label', default: 'Uploads')}" />

            <g:sortableColumn property="userComment" title="${message(code: 'attachment.userComment.label', default: 'User Comment')}" />

            %{--<g:sortableColumn property="path" title="${message(code: 'attachment.path.label', default: 'Path')}" />--}%

        </tr>
        </thead>
        <tbody>
        <g:each in="${contactInstance?.attachments}" status="i" var="attachmentInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>
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

            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>