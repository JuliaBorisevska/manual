import grails.util.GrailsUtil
import manual.Attachment
import manual.Contact
import manual.Phone

import java.text.DateFormat

class BootStrap {

    def init = { servletContext ->
        if (GrailsUtil.developmentEnv) {
            def julia = new Contact(
                    firstName: "Юлия",
                    lastName: "Борисевская",
                    middleName: "Валентиновна",
                    dateOfBirth: Date.parse("yyyy-MM-dd","1994-03-16"),
                    gender: "женский",
                    maritalStatus: "не женат/не замужем",
                    citizenship: "BLR",
                    email: "borisevska.yu@mail.ru",
                    country: "Беларусь",
                    town: "Минск",
                    address: "Коласа")
            julia.save()
            if (julia.hasErrors()){
                println(julia.errors)
            }
            def ph1 = new Phone(
                    countryCode: 375,
                    operatorCode: 29,
                    basicNumber: 2886668,
                    phoneType: "мобильный",
                    userComment: "MTC",
                    contact: julia
            )
            ph1.save()
            if (ph1.hasErrors()){
                println(ph1.errors)
            }
            def ph2 = new Phone(
                    countryCode: 375,
                    operatorCode: 44,
                    basicNumber: 1234566,
                    phoneType: "мобильный",
                    userComment: "Velcom",
                    contact: julia
            )
            ph2.save()
            if (ph2.hasErrors()){
                println(ph2.errors)
            }
            def attach1 = new Attachment(
                    title: "Файл",
                    path: "sds",
                    uploads: new Date(),
                    contact: julia
            )
            attach1.save()
            if (attach1.hasErrors()){
                println(attach1.errors)
            }
        }
    }
    def destroy = {
    }
}
