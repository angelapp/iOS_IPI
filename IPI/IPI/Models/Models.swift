//
//  Models.swift
//  IPI
//
//  Created by Felipe Zamudio on 29/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation
import ObjectMapper

/* State: pending */
//class ContactModel: Mappable {
//    var fullName: String!
//    var number: String!
//
//    init() {}
//
//    required init?(map: Map) {}
//
//    func mapping(map: Map) {
//        fullName <- map[JSONKeys.full_name]
//        number <- map[JSONKeys.number]
//    }
//}
//
///* State: pending */
//class ContactListModel: Mappable {
//
//    var contacList: Array<ContactModel>!
//
//    init() {}
//
//    required init?(map: Map) {}
//
//    func mapping(map: Map) {
//        contacList <- map[JSONKeys.contact_emergency_List]
//    }
//}

/* State: pending */
class CourseListModel: Mappable {

    var courseList: Array<Course>!

    init(courseList: Array<Course>!) {
        self.courseList = courseList
    }

    required init?(map: Map) {}

    func mapping(map: Map) {
        courseList <- map[JSONKeys.course_list]
    }
}

// Modelo con los datos basicos para guardar una actividad completada
class ActityCompleted {
    var courseID: Int!
    var topicID: Int!
    var activity: String!
    var dateCompleted: String!
}

// State: succed -- UserActivityProgress in android
class RequestCompleted: Mappable {
    var user: Int!
    var topic_activity: Int!
    var date_completed: String!

    init(user: Int, activity: Int, date: String) {
        self.user = user
        self.topic_activity = activity
        self.date_completed = date
    }

    required init?(map: Map) {}

    func mapping(map: Map) {
        user <- map[JSONKeys.user]
        topic_activity <- map[JSONKeys.topic_activity]
        date_completed <- map[JSONKeys.date_completed]
    }
}

class RequestAvatar: Mappable {
    var user: Int!
    var piece: Int!

    init(pieceID: Int) {
        self.user = AplicationRuntime.sharedManager.getUser().id
        self.piece = pieceID
    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        user <- map[JSONKeys.user]
        piece <- map[JSONKeys.avatar_piece]
    }
}

/** Modelo para definir el avatar */
class MyAvatarPieces {

    var headID: Int!
    var eyesID: Int!
    var noseID: Int!
    var hairID: Int!
    var accID: Int!
    var genderID: Int!

    init() {
    }
}

/* State: pending */
//class UserModel {
//    var email: String!
//    var username: String!
//    var token: String!
//    var id: Int!
//}

/// Model used for send request by socialnetwork
class SocialNetworkRegister : Mappable {
    var email: String!
    var access_token: String!

    //inicializador vacio
    init() {
    }

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        email <- map[JSONKeys.email]
        access_token <- map[JSONKeys.access_token]
    }
}

/// Model Used for keep the Authentication states
class StatesModel {
    var hasViewedOnboarding: Bool!
    var isLogin: Bool!
    var isThereAnAvatar: Bool!

    init() {
        self.isLogin = false
        self.isThereAnAvatar = false
        self.hasViewedOnboarding = false
    }
}

/* State: pending */
class FormatsBankItem {

    var name: String!
    var file: String!
    var ext: String!

    init(name: String, file: String, ext: String) {
        self.file = file
        self.name = name
        self.ext = ext
    }
}

/* State: pending */
class MyCommunityItem {

    var title: String!
    var objective: String!
    var note: String!
    var downloadCopy: String!
    var file: String!
    var ext: String!

    init(title: String, objective: String, note: String, downloadCopy: String, file: String, ext: String) {
        self.title = title
        self.objective = objective
        self.note = note
        self.downloadCopy = downloadCopy
        self.file = file
        self.ext = ext
    }
}

/** Modelo para obtener la imagen, título y progreso de determinado curso **/
class ModuleProgressItem {
    var image: String!
    var title: String!
    var progress: Float!

    init(image: String, title: String, progress: Float) {
        self.image = image
        self.title = title
        self.progress = progress
    }
}

/** Modelo para mantener el indice de la pág actual de los cursos */
class CoursesProgress {

    var COURSE_INDEX: Int! // Indice de pág para el curso Conceptos básicos

    init() {
        self.COURSE_INDEX = 0
    }
}

/** Módelo para pasar la información de la lista **Antes de Viajar** */
class BeforeTravelItem {
    var title: String!
    var audioID: Int!

    // Inicializador vacio
    init() {
    }

    // Inicializador completo del modelo
    init(title: String, audioID: Int) {
        self.title = title
        self.audioID = audioID
    }

    /** Crea y retorna la lista **Antes de Viajar**
    - Returns: lista de --BeforeTravelItem--
    */
    func getBeforeTravelItemList() -> [BeforeTravelItem] {

        return [BeforeTravelItem(title: Labels.before_travel_text1, audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_08.rawValue),
                BeforeTravelItem(title: Labels.before_travel_text2, audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_09.rawValue),
                BeforeTravelItem(title: Labels.before_travel_text3, audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_10.rawValue),
                BeforeTravelItem(title: Labels.before_travel_text4, audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_11.rawValue)]
    }
}

/** Módelo para pasar los datos de la lista desplegable al controlador correspondiente **/
class ExampleData {
    var header : String!
    var body : [String]!
    
    init() {
    }

    init(header: String, body: [String]) {
        self.header = header
        self.body = body
    }

    /** Arma la lista ejemplos del curso 
    - Returns: Arreglo la información por secciones
    **/
    func getSampleData() -> [ExampleData] {
        return [ExampleData(header: IPI_COURSE.PAGE_07.header1, body: [IPI_COURSE.PAGE_07.boby1]),
                ExampleData(header: IPI_COURSE.PAGE_07.header2, body: [IPI_COURSE.PAGE_07.boby2]),
                ExampleData(header: IPI_COURSE.PAGE_07.header3, body: [IPI_COURSE.PAGE_07.boby3]),
                ExampleData(header: IPI_COURSE.PAGE_07.header4, body: [IPI_COURSE.PAGE_07.boby4])]
    }
    
    /** Arma lista cuestionario
     - Returns: Arreglo la información por secciones
     **/
    func getInfoData() -> [ExampleData] {
        return [ExampleData(header: IPI_COURSE.PAGE_29.header_01, body: [IPI_COURSE.PAGE_29.boby_01]),
                ExampleData(header: IPI_COURSE.PAGE_29.header_02, body: [IPI_COURSE.PAGE_29.boby_02]),
                ExampleData(header: IPI_COURSE.PAGE_29.header_03, body: [IPI_COURSE.PAGE_29.boby_03]),
                ExampleData(header: IPI_COURSE.PAGE_29.header_04, body: [IPI_COURSE.PAGE_29.boby_04]),
                ExampleData(header: IPI_COURSE.PAGE_29.header_05, body: [IPI_COURSE.PAGE_29.boby_05])]
    }
}

/** Módelo para pasar los datos del slider del curso al controlador correspondiente **/
class SliderData {
    var title : String!
    var message : String!
    
    init() {
    }
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    /** Arma la lista para el slider
     - Returns: Arreglo la información por secciones
     */
    func getSliderData() -> [SliderData] {
        return [SliderData(title: IPI_COURSE.PAGE_15.slide0_title, message: IPI_COURSE.PAGE_15.slide0_text),
                SliderData(title: IPI_COURSE.PAGE_15.slide1_title, message: IPI_COURSE.PAGE_15.slide1_text),
                SliderData(title: IPI_COURSE.PAGE_15.slide2_title, message: IPI_COURSE.PAGE_15.slide2_text)]
    }
}
