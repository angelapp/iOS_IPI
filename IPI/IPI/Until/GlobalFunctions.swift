//
//  GlobalFunctions.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import AlamofireImage
import AVFoundation
import AVKit
import Foundation
import UIKit
import ObjectMapper

// MARK: - Funciones para obtener el contenido del tutorial
/**
 Retorna una lista [llave: Valor] con el contenido de cada una de los pasos del tutorial.

 - Parameter forIndex: Índice de la página actual.
 - Returns: Arreglo con: titulos, descripciones he imagenes del respectivo índice
 */
func getOnBoardingContent(forIndex id: Int) -> [String:String] {

    switch id {

    case OnboardingIndex.page_01.rawValue:
        return [IPIKeys.description.rawValue: ONBOARDING.PAGE_01.title,
                IPIKeys.image.rawValue: OnBoardingImages.onBoarding_01.rawValue]

    case OnboardingIndex.page_02.rawValue:
        return [IPIKeys.title.rawValue: ONBOARDING.PAGE_02.title,
                IPIKeys.description.rawValue: ONBOARDING.PAGE_02.description,
                IPIKeys.image.rawValue: OnBoardingImages.onBoarding_02.rawValue]

    case OnboardingIndex.page_03.rawValue:
        return [IPIKeys.title.rawValue: ONBOARDING.PAGE_03.title,
                IPIKeys.description.rawValue: ONBOARDING.PAGE_03.description,
                IPIKeys.image.rawValue: OnBoardingImages.onBoarding_03.rawValue]

    case OnboardingIndex.page_04.rawValue:
        return [IPIKeys.title.rawValue: ONBOARDING.PAGE_04.title,
                IPIKeys.description.rawValue: ONBOARDING.PAGE_04.description,
                IPIKeys.image.rawValue: OnBoardingImages.onBoarding_04.rawValue]

    case OnboardingIndex.page_05.rawValue:
        return [IPIKeys.title.rawValue: ONBOARDING.PAGE_05.title,
                IPIKeys.description.rawValue: ONBOARDING.PAGE_05.description,
                IPIKeys.image.rawValue: OnBoardingImages.onBoarding_05.rawValue]

    default:
        return [IPIKeys.title.rawValue: ONBOARDING.PAGE_06.title,
                IPIKeys.description.rawValue: ONBOARDING.PAGE_06.description,
                IPIKeys.image.rawValue: OnBoardingImages.onBoarding_06.rawValue]
    }
}

/**
 Muestra en la consola lo que esta pasando en ejecución

 - Parameter tag: Texto para indicar que parte del proceso se esta ejecutando
 */
func printDebugMessage(tag: String) {

    //Solo se muestra el mensaje en debug
    #if DEBUG
        print("\(debugFlag) \(tag)")
    #else
        return
    #endif
}

// MARK: - Transform Functions
/// convierte JSONString en diccionario
func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

/// Descargar la imagen y la carga al imageView
func downloadImage(imgView: UIImageView, urlImage: String!) {

    if urlImage != nil, let dowloadURL = NSURL(string: urlImage) {
        imgView.af_setImage(withURL: dowloadURL as URL)
    }
}

class Validations {

    // Valida que los campos de texto no esten vacios
    class func isValidData(fromField textField: UITextField, errorView: UILabel? = nil) -> Bool {
        guard !(textField.text?.isEmpty)!, textField.text != blankSpace else {
            errorView?.text = ErrorMessages.requiredField
            return false
        }

        errorView?.text = nullString
        return true
    }

    // Valida que el formato de email sea correcto
    class func isValidEmail(email:String, errorView: UILabel? = nil) -> Bool {
        let emailTest = NSPredicate(format: Formats.matchesFormat, Formats.emailRegEx)
        guard emailTest.evaluate(with: email) else {
            errorView?.text =  ErrorMessages.invalidEmail
            return false
        }

        errorView?.text = nullString
        return true
    }

    // Valida que el formato de contraseña sea el correcto
    class func isValidPass(pass:String, controller: UIViewController) -> Bool {
        let pswd = NSPredicate(format: Formats.matchesFormat, AplicationRuntime.sharedManager.getPswRegex())
        guard pswd.evaluate(with: pass) else {
            controller.showErrorMessage(withMessage: AplicationRuntime.sharedManager.getPswErrorMessage())
            return false
        }
        return true
    }
}

/// Guarda en local la fecha de finalización de una actividad.
/// - Parameter activity: Modelo con los datos de la actividad a guardar (id_curso, id_modulo, abreviatura, fecha)
/// - Returns: Verdadero, si puede guardar la fecha, False si ya se ha completado o no se puede realizar la acción
func saveProgress(forActivity activity: ActityCompleted) -> Array<RequestCompleted>! {
    
    let courses = StorageFunctions.loadActivitiesProgress() ?? AplicationRuntime.sharedManager.getAppConfig()?.course_Array

    // Busca el curso al que pertenece la actividad
    for course in courses! {
        if course.id == activity.courseID {
            
            for mod in course.course_topics {
                if mod.id == activity.topicID {
                    
                     //Busca la actividad que se desea guardar el progreso
                    for act in  mod.topic_activity_list {
                        if act.abreviature == activity.activity {
                            
                            // Guarda la fecha de finalización de a actividad si esta no existe
                            if act.dateCompleted == nil || act.dateCompleted == nullString {
                                act.dateCompleted = activity.dateCompleted
                                StorageFunctions.saveActivitiesProgress(courses: CourseListModel(courseList: courses!))
                                
                                return [RequestCompleted(user: AplicationRuntime.sharedManager.getUser().id, activity: act.id, date: activity.dateCompleted)]
                            }
                        }
                    }
                }
            }
        }
    }

    // Retorno por defecto
    return nil
}

///Obtine el progreso de acuerdo a las actividades que se han completado
/// - Parameter forCourse: ID del curso
/// - Returns: Arreglo con el progreso por módulo
func getProgress(forCourse index: Int) -> Array<ModuleProgressItem> {

    let courses = StorageFunctions.loadActivitiesProgress() ?? AplicationRuntime.sharedManager.getAppConfig()?.course_Array
    let images = [IPI_IMAGES.progress_connoisseur, IPI_IMAGES.progress_advanced, IPI_IMAGES.progress_expert]
    
    var progress: Array<ModuleProgressItem> = []

    // Busca el curso al que pertenece la actividad
    for course in courses! {

        if course.id == index {
            // Obtiene la lista de actividades, para un determinado modulo
            if let topics = course.course_topics {

                // Avanza por los modulos del
                var topicPos = 0
                for topic in topics {

                    var activitiesCompleted: Float = 0.0
                    for activity in topic.topic_activity_list {
                        if activity.dateCompleted != nil && activity.dateCompleted != nullString {
                            activitiesCompleted += 1
                        }
                    }

                    let progressValue: Float = activitiesCompleted / Float(topic.topic_activity_list.count)
                    progress.append(ModuleProgressItem(image: images[topicPos], title: topic.description, progress: progressValue))
                    topicPos += 1
                }
            }
        }
    }

    return progress
}

/**
 Function for order phonebook by organization type
 
 - Parameter phoneBook: List of phoneboook for order
 - Returns: List of organization type
*/
func orderByOrganizationType(phoneBook: Array<CorporatePhoneBook>) -> Array<OrganizationType> {
    
    // Check if exist Data
    guard let appConf = AplicationRuntime.sharedManager.getAppConfig(), phoneBook.count > 0 else { return [] }
    guard appConf.organization_types != nil, appConf.organization_types.count > 0 else { return [] }
    
    /// Arreglo auxiliar para mantener los Id de las Org que ya sean agregado al arreglo de retorno
    var aux: Array<Int> = []
    var orgList: Array<OrganizationType> = []
    
    // Looking available organizationType in phonebook
    for phone in phoneBook {
        
        // Looking organization type Data
        orgLoop: for org in appConf.organization_types {
            
            if org.id == phone.organization_type {
                
                // Verifica si la org ya se encuentar en el arreglo de retorno
                if !aux.contains(org.id) {
                    
                    // Init corporate registers if it's null
                    if org.registries == nil { org.registries = [] }
                    
                    // Add de current phonebook add sub-array phonebook
                    org.registries.append(phone)
                    orgList.append(org)
                    
                    // update index array
                    aux.append(org.id)
                }
                else {
                    // update sub-phonebook array when the city exist
                    // pos: position in registres
                    if let pos = aux.index(of: org.id) {
                        orgList[pos].registries.append(phone)
                    }
                }
                
                // Leave innerLoop
                break orgLoop
            }
        }
    }
    
    return orgList
}

