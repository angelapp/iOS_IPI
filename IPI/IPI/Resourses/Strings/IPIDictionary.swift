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
