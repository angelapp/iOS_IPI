//
//  StorageModels.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

/// Modelo de datos para guardar la data de un *Usuario*
class UserPreferences: NSObject{

    var jsonUserData: String!

    /** Recibe los datos del usuario como un texto JSON para almacenarlos en local */
    convenience init(user: String!){
        self.init()
        self.jsonUserData = user
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.jsonUserData as String, forKey: IPIKeys.userJSON.rawValue)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[IPIKeys.userJSON.rawValue] = self.jsonUserData

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initUser(fromDic dic: [String: Any]) -> String {
        let user =  dic[IPIKeys.userJSON.rawValue] as! String
        return user
    }
}

/// Modelo de datos para tener en local si ya se ha iniciado sesion
class StatesPreferences: NSObject {

    var hasViewedOnboarding: Bool!
    var isLogin: Bool!
    var isThereAnAvatar: Bool!

    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter states: estados
    convenience init(states: StatesModel){
        self.init()
        self.isLogin = states.isLogin
        self.isThereAnAvatar = states.isThereAnAvatar
        self.hasViewedOnboarding = states.hasViewedOnboarding
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.isLogin as Bool, forKey: IPIKeys.isLogin.rawValue)
        aCoder.encode(self.isThereAnAvatar as Bool, forKey: IPIKeys.isThereAnAvatar.rawValue)
        aCoder.encode(self.hasViewedOnboarding as Bool, forKey: IPIKeys.hasViewedOnboarding.rawValue)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[IPIKeys.isLogin.rawValue] = self.isLogin
        myDic[IPIKeys.isThereAnAvatar.rawValue] = self.isThereAnAvatar
        myDic[IPIKeys.hasViewedOnboarding.rawValue] = self.hasViewedOnboarding

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initState(fromDic dic: [String: Any]) -> StatesModel {
        let state = StatesModel()
        state.isLogin = dic[IPIKeys.isLogin.rawValue] as? Bool ?? false
        state.isThereAnAvatar = dic[IPIKeys.isThereAnAvatar.rawValue] as? Bool ?? false
        state.hasViewedOnboarding = dic[IPIKeys.hasViewedOnboarding.rawValue] as? Bool ?? false

        return state
    }
}

/// Modelo de datos para tener en local la configuración de la app
class AppConfigPreferences: NSObject {

    var jsonAppConfig: String!

    /** Recibe JSON con la configuración de la app para almacenarlos en local */
    convenience init(jsonConfig: String) {
        self.init()
        self.jsonAppConfig = jsonConfig
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.jsonAppConfig as String, forKey: IPIKeys.appConfig.rawValue)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[IPIKeys.appConfig.rawValue] = self.jsonAppConfig

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initConfig(fromDic dic: [String: Any]) -> String {
        let json = dic[IPIKeys.appConfig.rawValue] as! String
        return json
    }
}

/** Modelo de datos para almacenar en local el progreso de las actividades */
class ProgressActivitiesPreferences: NSObject {

    var jsonCourseActivities: String!

    /** Recibe JSON el contenido de los cursos (Topics - Topics' Activities */
    convenience init(jsonCourse: String) {
        self.init()
        self.jsonCourseActivities = jsonCourse
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.jsonCourseActivities as String, forKey: IPIKeys.activitiesProgress.rawValue)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[IPIKeys.activitiesProgress.rawValue] = self.jsonCourseActivities

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initCourse(fromDic dic: [String: Any]) -> String {
        let json = dic[IPIKeys.activitiesProgress.rawValue] as! String
        return json
    }
}

/** Modelo de datos para tener en local los indices del avance de los cursos */
class ProgressPreferences: NSObject {
    
    var course_index: Int!
    
    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter indices: estados
    convenience init(indices: CoursesProgress){
        self.init()
        self.course_index = indices.COURSE_INDEX
    }
    
    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.course_index as Int, forKey: IPIKeys.courseProgress.rawValue)
    }
    
    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()
        
        myDic[IPIKeys.courseProgress.rawValue] = self.course_index
        
        return myDic
    }
    
    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initProgress(fromDic dic: [String: Any]) -> CoursesProgress {
        let progress = CoursesProgress()
        
        progress.COURSE_INDEX = dic[IPIKeys.courseProgress.rawValue] as? Int ?? 0
        
        return progress
    }
}

/** Modelo de datos para tener en local los identificadores de las caractaeriticas del Avatar */
class MyAvatarPreferences: NSObject {

    var head: Int!
    var eyes: Int!
    var nose: Int!
    var hair: Int!
    var acc: Int!
    var gender: Int!

    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter indices: estados
    convenience init(pieces: MyAvatarPieces){
        self.init()
        self.head = pieces.headID
        self.eyes = pieces.eyesID
        self.nose = pieces.noseID
        self.hair = pieces.hairID
        self.acc = pieces.accID
        self.gender = pieces.genderID
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.head as Int, forKey: IPIKeys.head.rawValue)
        aCoder.encode(self.eyes as Int, forKey: IPIKeys.eyes.rawValue)
        aCoder.encode(self.nose as Int, forKey: IPIKeys.nose.rawValue)
        aCoder.encode(self.hair as Int, forKey: IPIKeys.hair.rawValue)
        aCoder.encode(self.acc as Int, forKey: IPIKeys.accesories.rawValue)
        aCoder.encode(self.gender as Int, forKey: IPIKeys.gender.rawValue)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[IPIKeys.head.rawValue] = self.head
        myDic[IPIKeys.eyes.rawValue] = self.eyes
        myDic[IPIKeys.nose.rawValue] = self.nose
        myDic[IPIKeys.hair.rawValue] = self.hair
        myDic[IPIKeys.accesories.rawValue] = self.acc
        myDic[IPIKeys.gender.rawValue] = self.gender

        return myDic
    }

    /// Crea un modelo de datos a apartir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initAvatar(fromDic dic: [String: Any]) -> MyAvatarPieces {
        let avatarPieces = MyAvatarPieces()

        avatarPieces.headID = dic[IPIKeys.head.rawValue] as? Int ?? 0
        avatarPieces.eyesID = dic[IPIKeys.eyes.rawValue] as? Int ?? 0
        avatarPieces.noseID = dic[IPIKeys.nose.rawValue] as? Int ?? 0
        avatarPieces.hairID = dic[IPIKeys.hair.rawValue] as? Int ?? 0
        avatarPieces.accID = dic[IPIKeys.accesories.rawValue] as? Int ?? 0
        avatarPieces.genderID = dic[IPIKeys.gender.rawValue] as? Int ?? 0

        return avatarPieces
    }
}
