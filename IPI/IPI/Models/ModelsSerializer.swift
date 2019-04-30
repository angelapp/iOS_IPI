//
//  ModelsSerializer.swift
//  IPI
//
//  Created by Felipe Zamudio on 29/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

/// Corporate Model
// State: succed
class CorporatePhoneBook: Mappable {
    
    var id: Int!
    var name: String!
    var mobile_phone: String!
    var address: String!
    var latitude: Float!
    var longitude: Float!
    var organization_type: Int!
    var city: Int!
    var is_active: Bool!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        mobile_phone <- map[JSONKeys.mobile_phone]
        address <- map[JSONKeys.address]
        latitude <- map[JSONKeys.latitude]
        longitude <- map[JSONKeys.longitude]
        organization_type <- map[JSONKeys.organization_type]
        city <- map[JSONKeys.city]
        is_active <- map[JSONKeys.is_active]
    }
}

/// Organization Type Model
// State: succed
class OrganizationType: Mappable {
    
    var id: Int!
    var name: String!
    var registries: Array<CorporatePhoneBook>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        registries <- map[JSONKeys.registries]
    }
}

// MARK: - User authenticated models

/// User Model for register
// State: succed
class RegisterUserProfileModel : Mappable {
    
    var email: String!
    var password: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        email <- map[JSONKeys.email]
        password <- map[JSONKeys.password]
    }
}

/// User Model for server response
// state: succed
class RegisterUserResponse : Mappable {
    
    var token: String!
    var user: UserSerializer!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        token <- map[JSONKeys.token]
        user <- map[JSONKeys.user]
    }
}

// state: succed
class UserSerializer : Mappable {
    
    var id: Int!
    var username: String!
    var email: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        username <- map[JSONKeys.username]
        email <- map[JSONKeys.email]
    }
}

// state: succed
class DocumentType: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var description: String!
    var icon: String!
    var documents: Array<LibraryDocument>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
        documents <- map[JSONKeys.documents]
    }
}

// NEW Model
// state: succed
class LibraryDocument: Mappable {
    var id: Int!
    var name: String!
    var description: String!
    var file: String!
    var doc_type: Int!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        description <- map[JSONKeys.description]
        file <- map[JSONKeys.file]
        doc_type <- map[JSONKeys.doc_type]
    }
}

// state: succed
class MigrationConditionType: Mappable {
    
    var id: Int!
    var name: String!
    var document_condition_list: Array<DocumentConditionType>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        document_condition_list <- map[JSONKeys.document_condition_list]
    }
}

// state: succed
class DocumentConditionType: Mappable {
    
    var id: Int!
    var name: String!
    var migration_condition: String!
    var basic_right_list: Array<BasicRight>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        migration_condition <- map[JSONKeys.migration_condition]
        basic_right_list <- map[JSONKeys.basic_right_list]
    }
}

// state: succed
class BasicRight: Mappable {
    var id: Int!
    var name: String!
    var description: String!
    var origin_country: Int!
    var target_country: Int!
    var document_condition: Int!
    var basic_right_type: Int!
    var is_active: Bool!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        description <- map[JSONKeys.description]
        origin_country <- map[JSONKeys.origin_country]
        target_country <- map[JSONKeys.target_country]
        document_condition <- map[JSONKeys.document_condition]
        basic_right_type <- map[JSONKeys.basic_right_type]
        is_active <- map[JSONKeys.is_active]
    }
}


// MARK: - Config App Models
// state: succed
class GeneralConfiguration: Mappable {
    
    var terms_condition_url: String!
    var min_pin_length: Int!
    var psw_regular_expression: String!
    var psw_error_recomendation: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        terms_condition_url <- map[JSONKeys.terms_condition_url]
        min_pin_length <- map[JSONKeys.min_pin_length]
        psw_regular_expression <- map[JSONKeys.psw_regular_expression]
        psw_error_recomendation <- map[JSONKeys.psw_error_recomendation]
    }
}

// State: succed
class ApplicationConfiguration: Mappable {
    
    var general_configuration: GeneralConfiguration!
    var document_type_Array: Array<DocumentType>!
    var contact_form_type_Array: Array<ContactFormType>!
    var gender_Array: Array<Gender>!
    var avatar_pieces_Array: Array<AvatarPiece>!
    var body_parts_Array: Array<BodyParts>!
    var course_Array: Array<Course>!
    
    // New Model
    var migration_condition_types: Array<MigrationConditionType>!
    var document_condition_types: Array<DocumentConditionType>!
    var organization_types: Array<OrganizationType>!
    var countries: Array<Country>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        general_configuration <- map[JSONKeys.general_configuration]
        document_type_Array <- map[JSONKeys.document_type_list]
        contact_form_type_Array <- map[JSONKeys.contact_form_type_list]
        gender_Array <- map[JSONKeys.gender_list]
        avatar_pieces_Array <- map[JSONKeys.avatar_pieces_list]
        body_parts_Array <- map[JSONKeys.body_parts_list]
        course_Array <- map[JSONKeys.course_list]
        
        //New
        migration_condition_types <- map[JSONKeys.migration_condition_types]
        document_condition_types <- map[JSONKeys.document_condition_types]
        organization_types <- map[JSONKeys.organization_types]
        countries <- map[JSONKeys.countries]
    }
}

// State: succed
class Gender: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        icon <- map[JSONKeys.icon]
    }
}

// State: succed
class City: Mappable {
    
    var id: Int!
    var name: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
    }
}

// State: succed, new
class Country: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var nationality: String!
    var country_cities: Array<City>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        nationality <- map[JSONKeys.nationality]
        country_cities <- map[JSONKeys.country_cities]
    }
}

// MARK: - CONTÁCTANOS

// State: succed
class ContactFormType: Mappable {
    
    var  id: Int!
    var  name: String!
    var  abreviature: String!
    var  description: String!
    var  icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

// State: succed
class ContactForm: Mappable {
    
    var  user: Int!
    var  message_type: Int!
    var  detail: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        user <- map[JSONKeys.user]
        message_type <- map[JSONKeys.message_type]
        detail <- map[JSONKeys.detail]
    }
}

// MARK: - CURSOS

// State: succed
class Course: Mappable {
    
    var  id: Int!
    var  name: String!
    var  abreviature: String!
    var  description: String!
    var  icon: String!
    var  course_topics: Array<Topic>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
        course_topics <- map[JSONKeys.course_topics]
    }
}

// State: succed
class Topic: Mappable {
    
    var  id: Int!
    var  course: Int!
    var  name: String!
    var  abreviature: String!
    var  description: String!
    var  icon: String!
    
    var  topic_activity_list: Array<TopicActivity>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        course <- map[JSONKeys.course]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
        
        topic_activity_list <- map[JSONKeys.topic_activity_list]
    }
}

// State: succed
class TopicActivity: Mappable {
    
    var  id: Int!
    var  topic: Int!
    var  name: String!
    var  abreviature: String!
    var  description: String!
    var  icon: String!
    var  ponderation_progress: Int!
    var  dateCompleted: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        topic <- map[JSONKeys.topic]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
        ponderation_progress <- map[JSONKeys.ponderation_progress]
        dateCompleted <- map[JSONKeys.date_completed]
    }
}

// State: succed
class SimpleResponseModel: Mappable {
    
    var  detail: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        detail <- map[JSONKeys.detail]
    }
}

// MARK: - Avatar Models

// State: succed
class BodyParts: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

// State: succed
class AvatarPiece: Mappable {
    
    var id: Int!
    var body_part: Int!
    var gender: Int!
    var name: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        body_part <- map[JSONKeys.body_part]
        gender <- map[JSONKeys.gender]
        name <- map[JSONKeys.name]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

// State: succed
class UserAvatar: Mappable {
    
    var user: Int!
    var avatar_piece: Int!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        user <- map[JSONKeys.user]
        avatar_piece <- map[JSONKeys.avatar_piece]
    }
}
