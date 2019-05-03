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

    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter states: estados
    convenience init(states: StatesModel){
        self.init()
        self.isLogin = states.isLogin
        self.hasViewedOnboarding = states.hasViewedOnboarding
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.isLogin as Bool, forKey: IPIKeys.isLogin.rawValue)
        aCoder.encode(self.hasViewedOnboarding as Bool, forKey: IPIKeys.hasViewedOnboarding.rawValue)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[IPIKeys.isLogin.rawValue] = self.isLogin
        myDic[IPIKeys.hasViewedOnboarding.rawValue] = self.hasViewedOnboarding

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initState(fromDic dic: [String: Any]) -> StatesModel {
        let state = StatesModel()
        state.isLogin = dic[IPIKeys.isLogin.rawValue] as? Bool ?? false
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

    var vbg_index: Int!
    var plc_index: Int!

    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter indices: estados
    convenience init(indices: CoursesProgress){
        self.init()
        self.vbg_index = indices.VBG_INDEX
        self.plc_index = indices.PLC_INDEX
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.vbg_index as Int, forKey: IPIKeys.vbgProgress)
        aCoder.encode(self.plc_index as Int, forKey: IPIKeys.plcProgress)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[IPIKeys.vbgProgress] = self.vbg_index
        myDic[IPIKeys.plcProgress] = self.plc_index

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initProgress(fromDic dic: [String: Any]) -> CoursesProgress {
        let progress = CoursesProgress()

        progress.VBG_INDEX = dic[IPIKeys.vbgProgress] as? Int ?? 0
        progress.PLC_INDEX = dic[IPIKeys.plcProgress] as? Int ?? 0

        return progress
    }
}

/** Modelo de datos para tener en local los identificadores de las caractaeriticas del Avatar */
class MyAvatarPreferences: NSObject {

    var skin: Int!
    var hair: Int!
    var eyes: Int!
    var mounth: Int!
    var acc: Int!
    var gender: Int!

    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter indices: estados
    convenience init(pieces: MyAvatarPieces){
        self.init()
        self.skin = pieces.skinID
        self.hair = pieces.hairID
        self.eyes = pieces.eyesID
        self.mounth = pieces.mouthID
        self.acc = pieces.accID
        self.gender = pieces.genderID
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.skin as Int, forKey: IPIKeys.skin)
        aCoder.encode(self.hair as Int, forKey: IPIKeys.hair)
        aCoder.encode(self.eyes as Int, forKey: IPIKeys.eyes)
        aCoder.encode(self.mounth as Int, forKey: IPIKeys.mounth)
        aCoder.encode(self.acc as Int, forKey: IPIKeys.accesories)
        aCoder.encode(self.gender as Int, forKey: IPIKeys.gender)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[IPIKeys.skin] = self.skin
        myDic[IPIKeys.hair] = self.hair
        myDic[IPIKeys.eyes] = self.eyes
        myDic[IPIKeys.mounth] = self.mounth
        myDic[IPIKeys.accesories] = self.acc
        myDic[IPIKeys.gender] = self.gender

        return myDic
    }

    /// Crea un modelo de datos a apartir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initAvatar(fromDic dic: [String: Any]) -> MyAvatarPieces {
        let avatarPieces = MyAvatarPieces()

        avatarPieces.skinID = dic[IPIKeys.skin] as? Int ?? 0
        avatarPieces.hairID = dic[IPIKeys.hair] as? Int ?? 0
        avatarPieces.eyesID = dic[IPIKeys.eyes] as? Int ?? 0
        avatarPieces.mouthID = dic[IPIKeys.mounth] as? Int ?? 0
        avatarPieces.accID = dic[IPIKeys.accesories] as? Int ?? 0
        avatarPieces.genderID = dic[IPIKeys.gender] as? Int ?? 0

        return avatarPieces
    }
}