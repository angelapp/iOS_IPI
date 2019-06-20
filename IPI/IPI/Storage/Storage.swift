//
//  Storage.swift
//  IPI
//
//  Created by Felipe Zamudio on 3/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

class StorageConfig: NSObject {

    var dataStorage: UserDefaults!

    static let share = StorageConfig()

    private override init() {
        super.init()
        dataStorage = UserDefaults.standard
    }

    /// Almacena en el dispositivo la data del usuario, asociandolo a una clave
    /// - Parameter key: Clave con la que será asociado el objeto en el dispositivo
    /// - Parameter value: Objeto que será almacenado
    func saveParameterFromKey (key: String, value:AnyObject){
        dataStorage.set(value, forKey: key)
        dataStorage.synchronize()
    }

    /// Obtiene los datos datos almacenados deacuerdo a una clave de entrada
    /// - Parameter key: Clave de la data almacenada
    /// - Returns: un Objeto con la data obtenida
    func getParameterFromKey(key: String) -> AnyObject! {
        let result = dataStorage.object(forKey: key)
        return result as AnyObject?
    }

    /// Elimina toda la data asociada a una clave
    /// - Parameter key: Clave de la data almacenada
    func clearParameterFromKey(key: String) {
        dataStorage.removeObject(forKey: key)
        dataStorage.synchronize()
    }
}

// Extensión de UserPreferences para agregar los métodos Archivar o Desarchivar la data de un usuario
extension UserPreferences {

    /// Archiva la data del usuario a partir de un diccionario de datos
    class func archive(user: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: user)
    }

    /// Desarchiva la data de un usuario
    /// - Returns: diccionario con la data del usuario
    class func unarchive (data: Data) -> [String:Any]! {
        guard let user = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]? else { return nil }
        return user
    }
}

// Extensión de AppConfigPreferences para agregar los métodos Archivar o Desarchivar
extension AppConfigPreferences {

    /// Archiva la configuración de la APP a partir de un diccionario de datos
    class func archive(conf: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: conf)
    }

    /// Desarchiva la data de un usuario
    /// - Returns: diccionario con la data del usuario
    class func unarchive (data: Data) -> [String:Any]! {
        guard let conf = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]? else { return nil }
        return conf
    }
}

// Extensión de StatesPreferences para agregar los metodos de Archivar o Desarchivar los estados de la App
extension StatesPreferences {

    /// Archiva los estados de la aplicación
    class func archive(states: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: states)
    }

    /// Desarchiva los estados
    /// - Returns: diccionario con los estados
    class func unarchive (data: Data) -> [String:Any]! {
        guard let states = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]? else {return nil}
        return states
    }
}

// Extensión de ProgressPreferences para agregar los metodos de Archivar o Desarchivar
extension ProgressPreferences {
    
    /// Archiva el progreso en los cursos
    class func archive(progress: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: progress)
    }
    
    /// Desarchiva la lista
    /// - Returns: diccionario con los indices de los cursos
    class func unarchive (data: Data) -> [String:Any]! {
        guard let progress = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]? else {return nil}
        return progress
    }
}

// Extensión de ProgressActivitiesPreferences para agregar los metodos de Archivar o Desarchivar
extension ProgressActivitiesPreferences {

    /// Archiva los cursos
    class func archive(course: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: course)
    }

    /// Desarchiva la lista
    /// - Returns: diccionario con los indices de los cursos
    class func unarchive (data: Data) -> [String:Any]! {
        guard let course = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]? else {return nil}
        return course
    }
}

// Extensión de AvatarPreferences para agregar los métodos Archivar o Desarchivar
extension MyAvatarPreferences {

    /// Archiva la data del usuario a partir de un diccionario de datos
    class func archive(avatar: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: avatar)
    }

    /// Desarchiva la data de un usuario
    /// - Returns: diccionario con la data del usuario
    class func unarchive (data: Data) -> [String:Any]! {
        guard let avatar = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]? else { return nil }
        return avatar
    }
}

// Extensión de AvatarPreferences para agregar los métodos Archivar o Desarchivar
extension MyAnswersPreferences {
    
    /// Archiva la data del usuario a partir de un diccionario de datos
    class func archive(answers: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: answers)
    }
    
    /// Desarchiva la data de un usuario
    /// - Returns: diccionario con la data del usuario
    class func unarchive (data: Data) -> [String:Any]! {
        guard let answers = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]? else { return nil }
        return answers
    }
}
