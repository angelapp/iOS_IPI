//
//  IPIDictionary.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

/// Ipi key dictionary
enum IPIKeys: String {
    case audio
    case accesories
    case activitiesProgress
    case appConfig
    case avatarPieces
    case avatarImg
    case courseProgress
    case description
    case eyes
    case gender
    case hair
    case hasViewedOnboarding
    case head
    case image
    case isLogin
    case isThereAnAvatar
    case nose
    case progress
    case states
    case user
    case userJSON
    case title
}

/// Facebook key dictionary
struct FBKeys {
    static let data = "data"
    static let email = "email"
    static let fields = "fields"
    static let first_name = "first_name"
    static let last_name = "last_name"
    static let me = "me"
    static let picture = "picture"
    static let publicProfile = "public_profile"
    /// Nombre, Apellido, email, he imagen de perfil
    static let profileParams = "first_name, last_name, email, picture.type(large)"
    static let url = "url"
}

/// Claves para los serializadores JSON
struct JSONKeys {

    //MARK: - A
    static let abreviature = "abreviature"
    static let access_token = "access_token"
    static let address = "address"
    static let avatar_piece = "avatar_piece"
    static let avatar_pieces_list  = "avatar_pieces_list"
    
    //MARK: - B
    static let basic_rights = "basic_rights"
	static let basic_right_list = "basic_right_list"
	static let basic_right_type = "basic_right_type"
    static let body_part = "body_part"
    static let body_parts_list = "body_parts_list"
    
    //MARK: - C
    static let call_from_inside_requirements = "call_from_inside_requirements"
    static let call_from_outside_requirements = "call_from_outside_requirements"
    static let case_study = "case_study"
    static let city = "city"
    static let contact_form_type_list = "contact_form_type_list"
	static let countries = "countries"
    static let country = "country"
	static let country_cities = "country_cities"
    static let currency = "currency"
    static let course = "course"
    static let course_list = "course_list"
    static let course_topics = "course_topics"
    
    //MARK: - D
    // static let date = "date"
    static let date_completed = "date_completed"
    static let description = "description"
    static let detail = "detail"
    static let distance = "distance"
	static let doc_type = "doc_type"
	static let documents = "documents"
	static let document_condition = "document_condition"
	static let document_condition_list = "document_condition_list"
    static let document_condition_types = "document_condition_types"
    static let document_type_list = "document_type_list"
    
    //MARK: - E
    static let email = "email"

    //MARK: - F
    static let file = "file"
    
    //MARK: - G
    static let gender = "gender"
    static let gender_list = "gender_list"
	static let general_configuration = "general_configuration"
    static let general_country_data = "general_country_data"
    
    //MARK: - H
    
    //MARK: - I
    static let icon = "icon"
    static let id = "id"
    static let international_id = "international_id"
    static let interview = "interview"
	static let is_active = "is_active"
    
    //MARK: - J
    
    //MARK: - K
    
    //MARK: - L
    static let latitude = "latitude"
    static let library = "library"
    static let longitude = "longitude"
    
    //MARK: - M
    static let max_temp = "max_temp"
    static let migration_authority = "migration_authority"
	static let migration_condition = "migration_condition"
    static let migration_condition_types = "migration_condition_types"
    static let migrations_requirements = "migrations_requirements"
    static let message_type = "message_type"
    static let min_pin_length = "min_pin_length"
    static let min_temp = "min_temp"
    static let mobile_phone = "mobile_phone"
    
    //MARK: - N
    static let name = "name"
	static let nationality = "nationality"
    static let nationalization_requirements = "nationalization_requirements"
    static let native_condition_description = "native_condition_description"
    static let notes = "notes"
    static let notification = "notification"
    
    //MARK: - O
    static let organization_type = "organization_type"
    static let organization_types = "organization_types"
    static let origin_city = "origin_city"
	static let origin_country = "origin_country"
    
    //MARK: - P
    static let password = "password"
    static let phonebook = "phonebook"
    static let ponderation_progress = "ponderation_progress"
    static let public_tranportation_info = "public_tranportation_info"
    static let psw_error_recomendation = "psw_error_recomendation"
    static let psw_regular_expression = "psw_regular_expression"
    
    //MARK: - Q
    
    //MARK: - R
    static let refugee_aplication = "refugee_aplication"
	static let registries = "registries"
    static let reminder = "reminder"
    static let request = "request"
    
    //MARK: - S
    
    //MARK: - T
    static let target_city = "target_city"
	static let target_country = "target_country"
    static let temp_by_city = "temp_by_city"
    static let temp_units = "temp_units"
    static let terms_condition_url = "terms_condition_url"
    static let time_between_cities = "time_between_cities"
    static let token = "token"
    static let topic = "topic"
    static let topic_activity = "topic_activity"
    static let topic_activity_list = "topic_activity_list"
    static let trm = "trm"
    
    //MARK: - U
    static let user = "user"
    static let username = "username"
    
    //MARK: - V
    static let visas = "visas"
    
    //MARK: - W
    static let where_to_go = "where_to_go"
    
    //MARK: - X
    
    //MARK: - Y
    
    //MARK: - Z
}
