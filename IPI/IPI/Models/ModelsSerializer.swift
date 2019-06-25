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
class CorporatePhoneBook: Mappable {
    
    var id: Int!
    var name: String!
//    var descrition: String!
//    var phone: String!
    var mobile_phone: String!
    var address: String!
//    var url: String!
//    var twitter: String!
//    var email: String!
//    var schedule: String!
    var latitude: Float!
    var longitude: Float!
    var organization_type: Int!
//    var icon: String!
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
class LibraryDocument: Mappable {
    var id: Int!
    var name: String!
    var description: String!
    var file: String!
    var url: String!
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
        url <- map[JSONKeys.url]
        doc_type <- map[JSONKeys.doc_type]
    }
}

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

class SimpleResponseModel: Mappable {
    
    var  detail: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        detail <- map[JSONKeys.detail]
    }
}

// MARK: - Avatar Models
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

// MARK: - Plan your trip Models
/// Model for mapping destination country Information
class PlanYourTripModel: Mappable {
    
    //Variable for local unmapping
    var natCountryID: Int! // Keep the origin country
    var desCountryID: Int! // Keep the destination country
    
    //country origin and country target filter
    var basic_rights: Array<BasicRight>!
    ///country origin and country target filter
    var migrations_requirements: Array<MigrationsRequirementsModel>!
    var general_country_data: GeneralCountryDataModel!
    var nationalization_requirements: NationalizationRequirements!
    var refugee_aplication: RefugeeAplication!
    var visas: Array<VisaModel>!
    var temp_by_city: Array<TempByCityModel>!
    var public_tranportation_info: Array<TransportationInfoModel>!
    var phonebook: Array<CorporatePhoneBook>!
    var library: Array<LibraryDocument>!
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        natCountryID <- map[JSONKeys.natCountryID]
        desCountryID <- map[JSONKeys.desCountryID]
        general_country_data <- map[JSONKeys.general_country_data]
        refugee_aplication <- map[JSONKeys.refugee_aplication]
        nationalization_requirements <- map[JSONKeys.nationalization_requirements]
        visas <- map[JSONKeys.visas]
        migrations_requirements <- map[JSONKeys.migrations_requirements]
        temp_by_city <- map[JSONKeys.temp_by_city]
        public_tranportation_info <- map[JSONKeys.public_tranportation_info]
        basic_rights <- map[JSONKeys.basic_rights]
        phonebook <- map[JSONKeys.phonebook]
        library <- map[JSONKeys.library]
    }
}

class GeneralCountryDataModel: Mappable {
    
    var id: Int!
    var international_id: String!
    var currency: String!
    var trm: String!
    var migration_authority: String!
    var call_from_inside_requirements: String!
    var call_from_outside_requirements: String!
    var native_condition_description: String!
    var country: Int!
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        international_id <- map[JSONKeys.international_id]
        currency <- map[JSONKeys.currency]
        trm <- map[JSONKeys.trm]
        migration_authority <- map[JSONKeys.migration_authority]
        call_from_inside_requirements <- map[JSONKeys.call_from_inside_requirements]
        call_from_outside_requirements <- map[JSONKeys.call_from_outside_requirements]
        native_condition_description <- map[JSONKeys.native_condition_description]
        country <- map[JSONKeys.country]
    }
}

class RefugeeAplication: Mappable {
    var id: Int!
    var request: String!
    var interview: String!
    var case_study: String!
    var notification: String!
    var where_to_go: String!
    var origin_country: Int!
    var is_active: Bool!
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        request <- map[JSONKeys.request]
        interview <- map[JSONKeys.interview]
        case_study <- map[JSONKeys.case_study]
        notification <- map[JSONKeys.notification]
        where_to_go <- map[JSONKeys.where_to_go]
        origin_country <- map[JSONKeys.origin_country]
        is_active <- map[JSONKeys.is_active]
    }
}

class NationalizationRequirements: Mappable {
    var id: Int!
    var native_condition_description: String!
    var description: String!
    var reminder: String!
    var origin_city: Int!
    var is_active: Bool!
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        native_condition_description <- map[JSONKeys.native_condition_description]
        description <- map[JSONKeys.description]
        reminder <- map[JSONKeys.reminder]
        origin_city <- map[JSONKeys.origin_city]
        is_active <- map[JSONKeys.is_active]
    }
}

// Modelo Visas
class VisaModel: Mappable {
    var id: Int!
    var name: String!
    var description: String!
    var is_active: Bool!
    var target_country: Int!
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        description <- map[JSONKeys.description]
        is_active <- map[JSONKeys.is_active]
        target_country <- map[JSONKeys.target_country]
    }
}

class MigrationsRequirementsModel: Mappable {
    var id: Int!
    var description: String!
    var origin_country: Int!
    var target_country: Int!
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        description <- map[JSONKeys.description]
        origin_country <- map[JSONKeys.origin_country]
        target_country <- map[JSONKeys.target_country]
    }
}

class TempByCityModel: Mappable {
    var id: Int!
    var min_temp: Int!
    var max_temp: Int!
    var city: Int!
    var temp_units: Int!
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        min_temp <- map[JSONKeys.min_temp]
        max_temp <- map[JSONKeys.max_temp]
        city <- map[JSONKeys.city]
        temp_units <- map[JSONKeys.temp_units]
    }
}

class TransportationInfoModel: Mappable {
    var id: Int!
    var distance: String!
    var time_between_cities: String!
    var notes: String!
    var origin_city: Int!
    var target_city: Int!
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        distance <- map[JSONKeys.distance]
        time_between_cities <- map[JSONKeys.time_between_cities]
        notes <- map[JSONKeys.notes]
        origin_city <- map[JSONKeys.origin_city]
        target_city <- map[JSONKeys.target_city]
    }
}
