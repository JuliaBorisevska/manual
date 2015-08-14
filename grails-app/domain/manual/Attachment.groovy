package manual

class Attachment {

    String title
    String path
    Date uploads
    String userComment

    static belongsTo = [contact: Contact]

    static constraints = {
        title(nullable: false, blank: false, maxSize: 30)
        uploads()
        userComment(nullable: true, widget: 'textarea')
    }
}
