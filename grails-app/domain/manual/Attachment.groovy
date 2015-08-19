package manual

class Attachment {

    String title
    String path = "new"
    Date uploads
    String userComment
    boolean deleted
    static transients = [ 'deleted' ]

    static belongsTo = [contact: Contact]

    static constraints = {
        title(nullable: false, blank: false, maxSize: 30)
        path(nullable: true)
        uploads()
        userComment(nullable: true, widget: 'textarea')
        deleted(bindable: true)
    }
}
