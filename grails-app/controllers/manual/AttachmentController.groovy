package manual



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AttachmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Attachment.list(params), model:[attachmentInstanceCount: Attachment.count()]
    }

    def show(Attachment attachmentInstance) {
        respond attachmentInstance
    }

    def create() {
        respond new Attachment(params)
    }

    @Transactional
    def save(Attachment attachmentInstance) {
        if (attachmentInstance == null) {
            notFound()
            return
        }

        if (attachmentInstance.hasErrors()) {
            respond attachmentInstance.errors, view:'create'
            return
        }

        attachmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachmentInstance.id])
                redirect attachmentInstance
            }
            '*' { respond attachmentInstance, [status: CREATED] }
        }
    }

    def edit(Attachment attachmentInstance) {
        respond attachmentInstance
    }

    @Transactional
    def update(Attachment attachmentInstance) {
        if (attachmentInstance == null) {
            notFound()
            return
        }

        if (attachmentInstance.hasErrors()) {
            respond attachmentInstance.errors, view:'edit'
            return
        }

        attachmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Attachment.label', default: 'Attachment'), attachmentInstance.id])
                redirect attachmentInstance
            }
            '*'{ respond attachmentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Attachment attachmentInstance) {

        if (attachmentInstance == null) {
            notFound()
            return
        }

        attachmentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Attachment.label', default: 'Attachment'), attachmentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
