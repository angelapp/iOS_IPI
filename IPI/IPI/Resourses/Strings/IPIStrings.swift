//
//  IPIStrings.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

// Global constants
let appName = "IPI Conse"
let debugFlag = "♻️ \(appName)_Debug: "

let blankSpace = " "
let nullString = ""
let jumpLine = "\n"
let subject = "Subject"
let titleTextColor = "titleTextColor"
let resetButtonTitle = "Reiniciar Curso"

let URL_GENERAL_SETTINGS = "App-Prefs:root=General"
let URL_LOCATION_SERVICES = "App-Prefs:root=LOCATION_SERVICES"
let URL_WIFI_SETTINGS = "App-Prefs:root=WIFI"

// MARK: - AVATAR, CONFIG
struct AvatarStrings {
    static let avatarTitle = "Arma tu Conse"
    static let avatarMessage = "El Consejero o Consejera es una persona que te acompañará mientras estés usando la aplicación. Inicia seleccionando si quieres que sea hombre o mujer y luego define sus rasgos físicos y accesorios."
    static let btn_avatarMale = "Conse Hombre"
    static let btn_avatarFemale = "Conse Mujer"
    static let uploadSuccess = "Avatar guardado satisfactoriamente!"
}

struct ConfigStrings {
    static let letStartMessage = "Hola soy tu Conse y voy a estar acompañándote en este recorrido. Traigo mucha información y herramientas que me gustaría compartir contigo"
    static let letStartTitle = "¡Iniciemos!"
}

// MARK: - ONBOARDING
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
        static let title = "Explora el menú lateral"
        static let description = "Y accede rápidamente a todas las secciones y servicios que IPI te ofrece.\nIPI, Información de Protección Internacional."
    }
    
    struct PAGE_06 {
        static let title = "Guarda tus consultas"
        static let description = "Puedes guardar la preparación de tu viaje y revisarla cuando estés sin conexión. Encuéntrala en el botón Última Consulta del menú lateral"
        static let inBold = "Última Consulta"
    }
}
