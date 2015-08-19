package manual

class Phone {

    Integer countryCode
    Integer operatorCode
    Long basicNumber
    String phoneType
    String userComment
    boolean deleted
    static transients = [ 'deleted' ]

    static belongsTo = [contact: Contact]

    static constraints = {
        countryCode(matches: "^\\d{3}\$")
        operatorCode(matches: "^\\d{2,4}\$")
        basicNumber(matches: "^\\d{5,7}\$")
        phoneType(inList: ["мобильный","домашний","рабочий"])
        userComment(nullable: true, widget: 'textarea')
        deleted(bindable: true)
    }
}
