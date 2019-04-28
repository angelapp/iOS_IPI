//
//  GlobalFunctions.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

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
