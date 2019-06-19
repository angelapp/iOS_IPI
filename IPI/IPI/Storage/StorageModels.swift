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

/** Modelo de datos para tener en local las respuestas del cuestionario del modulo 3 */
class MyAnswersPreferences: NSObject {

    var answer_01: Int!
    var answer_02: Int!
    var answer_03: Int!
    var answer_04: Int!
    var answer_05: Int!

    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter answers: respuestas
    convenience init(answers: PNPIAnswers){
        self.init()
        self.answer_01 = answers.answer_01
        self.answer_02 = answers.answer_02
        self.answer_03 = answers.answer_03
        self.answer_04 = answers.answer_04
        self.answer_05 = answers.answer_05
    }

    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.answer_01 as Int, forKey: IPIKeys.answer_01.rawValue)
        aCoder.encode(self.answer_02 as Int, forKey: IPIKeys.answer_02.rawValue)
        aCoder.encode(self.answer_03 as Int, forKey: IPIKeys.answer_03.rawValue)
        aCoder.encode(self.answer_04 as Int, forKey: IPIKeys.answer_04.rawValue)
        aCoder.encode(self.answer_05 as Int, forKey: IPIKeys.answer_05.rawValue)
    }

    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()

        myDic[IPIKeys.answer_01.rawValue] = self.answer_01
        myDic[IPIKeys.answer_02.rawValue] = self.answer_02
        myDic[IPIKeys.answer_03.rawValue] = self.answer_03
        myDic[IPIKeys.answer_04.rawValue] = self.answer_04
        myDic[IPIKeys.answer_05.rawValue] = self.answer_05

        return myDic
    }

    /// Crea un modelo de datos a apartir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initAvatar(fromDic dic: [String: Any]) -> PNPIAnswers {
        let answers = PNPIAnswers()

        answers.answer_01 = dic[IPIKeys.answer_01.rawValue] as? Int ?? 0
        answers.answer_02 = dic[IPIKeys.answer_02.rawValue] as? Int ?? 0
        answers.answer_03 = dic[IPIKeys.answer_03.rawValue] as? Int ?? 0
        answers.answer_04 = dic[IPIKeys.answer_04.rawValue] as? Int ?? 0
        answers.answer_05 = dic[IPIKeys.answer_05.rawValue] as? Int ?? 0

        return answers
    }
}