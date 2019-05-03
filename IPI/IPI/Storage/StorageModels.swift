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
        aCoder.encode(self.jsonUserData as String, forKey: DicKeys.userJSON)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[DicKeys.userJSON] = self.jsonUserData

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initUser(fromDic dic: [String: Any]) -> String {
        let user =  dic[DicKeys.userJSON] as! String
        return user
    }
}

/// Modelo de datos para tener en local si ya se ha iniciado sesion
class StatesPreferences: NSObject {

    var wasLoggedAtSomeTime: Bool!
    var isLogin: Bool!

    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter states: estados
    convenience init(states: StatesModel){
        self.init()
        self.isLogin = states.isLogin
        self.wasLoggedAtSomeTime = states.wasLoggedAtSomeTime
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.isLogin as Bool, forKey: DicKeys.isLogin)
        aCoder.encode(self.wasLoggedAtSomeTime as Bool, forKey: DicKeys.wasLoggedAtSomeTime)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[DicKeys.isLogin] = self.isLogin
        myDic[DicKeys.wasLoggedAtSomeTime] = self.wasLoggedAtSomeTime

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initState(fromDic dic: [String: Any]) -> StatesModel {
        let state = StatesModel()
        state.isLogin = dic[DicKeys.isLogin] as? Bool ?? false
        state.wasLoggedAtSomeTime = dic[DicKeys.wasLoggedAtSomeTime] as? Bool ?? false

        return state
    }
}

/// Modelo de datos para tener en local los contactos de confianza
class ContactPreferences: NSObject {

    var jsonContact: String!

    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter jsonContacts: Lista de contactos mapeados en formato JSON
    convenience init(jsonContacts: String) {
        self.init()
        self.jsonContact = jsonContacts
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.jsonContact as String, forKey: DicKeys.contactList)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[DicKeys.contactList] = self.jsonContact

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initContactList(fromDic dic: [String: Any]) -> String {
        let json = dic[DicKeys.contactList] as! String
        return json
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
        aCoder.encode(self.jsonAppConfig as String, forKey: DicKeys.appConfig)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[DicKeys.appConfig] = self.jsonAppConfig

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initConfig(fromDic dic: [String: Any]) -> String {
        let json = dic[DicKeys.appConfig] as! String
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
        aCoder.encode(self.jsonCourseActivities as String, forKey: DicKeys.activitiesProgress)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[DicKeys.activitiesProgress] = self.jsonCourseActivities

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initCourse(fromDic dic: [String: Any]) -> String {
        let json = dic[DicKeys.activitiesProgress] as! String
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
        aCoder.encode(self.vbg_index as Int, forKey: DicKeys.vbgProgress)
        aCoder.encode(self.plc_index as Int, forKey: DicKeys.plcProgress)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[DicKeys.vbgProgress] = self.vbg_index
        myDic[DicKeys.plcProgress] = self.plc_index

        return myDic
    }

    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initProgress(fromDic dic: [String: Any]) -> CoursesProgress {
        let progress = CoursesProgress()

        progress.VBG_INDEX = dic[DicKeys.vbgProgress] as? Int ?? 0
        progress.PLC_INDEX = dic[DicKeys.plcProgress] as? Int ?? 0

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
        aCoder.encode(self.skin as Int, forKey: DicKeys.skin)
        aCoder.encode(self.hair as Int, forKey: DicKeys.hair)
        aCoder.encode(self.eyes as Int, forKey: DicKeys.eyes)
        aCoder.encode(self.mounth as Int, forKey: DicKeys.mounth)
        aCoder.encode(self.acc as Int, forKey: DicKeys.accesories)
        aCoder.encode(self.gender as Int, forKey: DicKeys.gender)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[DicKeys.skin] = self.skin
        myDic[DicKeys.hair] = self.hair
        myDic[DicKeys.eyes] = self.eyes
        myDic[DicKeys.mounth] = self.mounth
        myDic[DicKeys.accesories] = self.acc
        myDic[DicKeys.gender] = self.gender

        return myDic
    }

    /// Crea un modelo de datos a apartir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initAvatar(fromDic dic: [String: Any]) -> MyAvatarPieces {
        let avatarPieces = MyAvatarPieces()

        avatarPieces.skinID = dic[DicKeys.skin] as? Int ?? 0
        avatarPieces.hairID = dic[DicKeys.hair] as? Int ?? 0
        avatarPieces.eyesID = dic[DicKeys.eyes] as? Int ?? 0
        avatarPieces.mouthID = dic[DicKeys.mounth] as? Int ?? 0
        avatarPieces.accID = dic[DicKeys.accesories] as? Int ?? 0
        avatarPieces.genderID = dic[DicKeys.gender] as? Int ?? 0

        return avatarPieces
    }
}