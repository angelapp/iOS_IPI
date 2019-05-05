//
//  GlobalFunctions.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation
import UIKit

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
