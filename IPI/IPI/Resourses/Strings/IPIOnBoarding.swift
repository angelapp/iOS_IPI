//
//  IPIOnBoarding.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

// MARK: - TEXTS
struct ONBOARDING {
    
    struct PAGE_01{
        static let title = "¿Has tenido que huir de tu país y no sabes a qué tienes derecho?"
    }
    
    struct PAGE_02 {
        static let title = "¿Necesitas información?"
        static let description = "En la sección Planea tu Viaje encontrarás datos actualizados para tomar decisiones informadas."
        
    }
    
    struct PAGE_03 {
        static let title = "¿Sabes qué derechos tienen las Personas en Necesidad de Protección Internacional?"
        static let description = "Navega por el curso interactivo y conoce cómo acceder a tus derechos en otros países."
        
    }
    
    struct PAGE_04 {
        static let title = "Crea tu Conse"
        static let description = "Conse te acompañará planeando tu viaje o aprendiendo sobre protección internacional."
    }
    
    struct PAGE_05 {
        static let title = "Guarda tus consultas"
        static let description = "Puedes guardar la preparación de tu viaje y revisarla cuando estés sin conexión. Encuéntrala en el botón Última Consulta del menú lateral"
        static let inBold = "Última Consulta"
    }
    
    struct PAGE_06 {
        static let title = "Explora el menú lateral"
        static let description = "Y accede rápidamente a todas las secciones y servicios que IPI te ofrece.\nIPI, Información de Protección Internacional."
    }
}

// MARK: - IMAGES
enum OnBoardingImages: String {
    case onBoarding_01, onBoarding_02, onBoarding_03, onBoarding_04, onBoarding_05, onBoarding_06
}

enum OnboardingIndex: Int, CaseIterable {
    case page_01, page_02, page_03, page_04, page_05, page_06
}
