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

// MARK: - Buttons
struct Buttons {
    static let end = "FINALIZAR"
    static let next = "SIGUIENTE"
    static let skip = "SALTAR"
}
