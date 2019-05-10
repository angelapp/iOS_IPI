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

// REVISAR
/// Guarda en local la fecha de finalización de una actividad.
/// - Parameter activity: Modelo con los datos de la actividad a guardar (id_curso, id_modulo, abreviatura, fecha)
/// - Returns: Verdadero, si puede guardar la fecha, False si ya se ha completado o no se puede realizar la acción
func saveProgress(forActivity activity: ActityCompleted) -> Array<RequestCompleted>! {

    let courses = StorageFunctions.loadActivitiesProgress() ?? AplicationRuntime.sharedManager.getAppConfig()?.course_Array

    // Busca el curso al que pertenece la actividad
    for course in courses! {
        if course.id == activity.courseID {

            // Obtiene la lista de actividades, para un determinado modulo
            if let activies = course.course_topics[activity.topicID].topic_activity_list {

                // Busca la actividad que se desa guardar el progreso
                for act in activies {

                    if act.abreviature == activity.activity {

                        // Guarda la fecha de finalización de a actividad si esta no existe
                        if act.dateCompleted == nil || act.dateCompleted == nullString {
                            act.dateCompleted = activity.dateCompleted
                            StorageFunctions.saveActivitiesProgress(courses: CourseListModel(courseList: courses!))

                            return [RequestCompleted(user: AplicationRuntime.sharedManager.getUser().id, activity: act.id, date: activity.dateCompleted)]
                        }
                        else {
                            return nil
                        }
                    }
                }
            }
        }
    }

    // Retorno por defecto
    return nil
}

// REVISAR
func getProgress(forCourse index: Int) -> Array<ModuleProgressItem> {

    let imageComplet = [ProgressStrings.image_begginer, ProgressStrings.image_expert, ProgressStrings.image_advanced, ProgressStrings.image_star]
    let imageIncomplet = [ProgressStrings.image_begginer_off, ProgressStrings.image_expert_off, ProgressStrings.image_advanced_off, ProgressStrings.image_star_off]

    // Carga los titulos de acuerdo al genero del usuario
    let titles = [getInsignia(forModule: .MOD_01), getInsignia(forModule: .MOD_02), getInsignia(forModule: .MOD_03), getInsignia(forModule: .MOD_04)]

    let courses = StorageFunctions.loadActivitiesProgress() ?? AplicationRuntime.sharedManager.getAppConfig()?.course_Array
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
                    let imgTrophy = (progressValue == 1) ? imageComplet[topicPos] : imageIncomplet[topicPos]
                    progress.append(ModuleProgressItem(image: imgTrophy, title: titles[topicPos], progress: progressValue))
                    topicPos += 1
                }
            }
        }
    }

    return progress
}