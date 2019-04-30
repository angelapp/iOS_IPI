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
    
    case description
    case image
    case title
    case hasViewedOnboarding
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
    //static let about_noruegan_council = "about_noruegan_council"
    static let abreviature = "abreviature"
    //static let actual_city = "actual_city"
    static let address = "address"
    static let avatar_piece = "avatar_piece"
    static let avatar_pieces_list  = "avatar_pieces_list"
    //
    ////MARK: - B
    ////static let birthdate = "birthdate"
	static let basic_right_list = "basic_right_list"
	static let basic_right_type = "basic_right_type"
    static let body_part = "body_part"
    static let body_parts_list = "body_parts_list"
    //
    ////MARK: - C
    static let city = "city"
    ////static let city_list = "city_list"
    //static let code = "code"
    //static let condition = "condition"
    //static let condition_list = "condition_list"
    //static let contact_emergency_List = "contact_list"
    static let contact_form_type_list = "contact_form_type_list"
    //static let contact_phone = "contact_phone"
    //static let country = "country"
	static let countries = "countries"
	static let country_cities = "country_cities"
    static let course = "course"
    static let course_list = "course_list"
    static let course_topics = "course_topics"
    //
    ////MARK: - D
    // static let date = "date"
    static let date_completed = "date_completed"
    static let description = "description"
    static let detail = "detail"
	static let doc_type = "doc_type"
	static let documents = "documents"
    //static let document_by_type = "document_by_type"
	static let document_condition = "document_condition"
	static let document_condition_list = "document_condition_list"
    static let document_condition_types = "document_condition_types"
    //static let document_number = "document_number"
    //static let document_type = "document_type"
    static let document_type_list = "document_type_list"
    //
    ////MARK: - E
    static let email = "email"
    //static let emergency_message = "emergency_message"
    //static let ethnic_group = "ethnic_group"
    //static let ethnic_group_list = "ethnic_group_list"
    //
    ////MARK: - F
    static let file = "file"
    //static let file_ext = "extension"
    //static let first_name = "first_name"
    //static let full_name = "full_name"
    //
    ////MARK: - G
    static let gender = "gender"
    static let gender_list = "gender_list"
	static let general_configuration = "general_configuration"
    //
    ////MARK: - H
    //
    ////MARK: - I
    static let icon = "icon"
    static let id = "id"
	static let is_active = "is_active"
    //static let isNRCBeneficiary = "isNRCBeneficiary"
    //
    ////MARK: - J
    //
    ////MARK: - K
    //
    ////MARK: - L
    //static let last_name = "last_name"
    static let latitude = "latitude"
    static let longitude = "longitude"
    //
    ////MARK: - M
	static let migration_condition = "migration_condition"
    static let migration_condition_types = "migration_condition_types"
    static let message_type = "message_type"
    static let min_pin_length = "min_pin_length"
    static let mobile_phone = "mobile_phone"
    //static let more_info_link = "more_info_link"
    //
    ////MARK: - N
    static let name = "name"
	static let nationality = "nationality"
    //static let news_category = "news_category"
    //static let number = "number"
    //
    ////MARK: - O
    //static let organization_by_type = "organization_by_type"
    static let organization_type = "organization_type"
    static let organization_types = "organization_types"
    //static let origin_city = "origin_city"
	static let origin_country = "origin_country"
    //
    ////MARK: - P
    static let password = "password"
    //static let phone = "phone"
    static let ponderation_progress = "ponderation_progress"
    //static let profile = "profile"
    static let psw_error_recomendation = "psw_error_recomendation"
    static let psw_regular_expression = "psw_regular_expression"
    //
    ////MARK: - Q
    //
    ////MARK: - R
    //static let role = "role"
    //static let role_list = "role_list"
	static let registries = "registries"
    //
    ////MARK: - S
    //static let schedule = "schedule"
    //static let state = "state"
    //static let state_list = "state_list"
    //
    ////MARK: - T
	static let target_country = "target_country"
    static let terms_condition_url = "terms_condition_url"
    //static let title = "tittle"
    static let token = "token"
    static let topic = "topic"
    static let topic_activity = "topic_activity"
    static let topic_activity_list = "topic_activity_list"
    //static let twitter = "twitter"
    //
    ////MARK: - U
    //static let url = "url"
    static let user = "user"
    static let username = "username"
    //
    ////MARK: - V
    //static let video_tutorial_id = "video_tutorial_id"
    //
    ////MARK: - W
    //
    ////MARK: - X
    //
    ////MARK: - Y
    //
    ////MARK: - Z
}
