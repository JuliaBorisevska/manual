package manual

class Contact {

    String lastName
    String firstName
    String middleName
    Date dateOfBirth
    String citizenship
    String website
    String email
    String company
    String gender
    String maritalStatus
    String image
    String country
    String town
    String address
    Long zipcode

    static hasMany = [phones: Phone, attachments: Attachment]

    static constraints = {
        lastName(nullable: false, blank: false, maxSize: 30)
        firstName(nullable: false, blank: false, maxSize: 30)
        middleName(nullable: true, maxSize: 30)
        dateOfBirth(nullable: false, blank: false, validator: {return (it < new Date())})
        citizenship(nullable: true, maxSize: 50)
        website(nullable: true, url: true, maxSize: 30)
        email(nullable: true, email: true)
        company(nullable: true, maxSize: 30)
        gender(inList: ["женский", "мужской"])
        maritalStatus(inList: ["женат/замужем", "не женат/не замужем"])
        country(nullable: false, blank: false, maxSize: 50)
        town(nullable: true, maxSize: 30)
        address(nullable: true, maxSize: 70)
        zipcode(nullable: true)
        image(nullable: true)
    }
}

