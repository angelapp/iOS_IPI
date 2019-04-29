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
    static let accept = "Aceptar"
    static let end = "FINALIZAR"
    static let forgot = "¿Olvidaste la contraseña?"
    static let login = "O inicia sesión"
    static let next = "SIGUIENTE"
    static let ready = "Listo"
    static let send = "Enviar"
    static let signin = "Ingresar"
    static let signup = "Regístrate"
    static let skip = "SALTAR"
}

// MARK: - Lables
struct Labels {
    static let create_account = "Crea tu cuenta"
    static let welcome = "Te damos la bienvenida a:"
    
    static let hint_email = "Correo electrónico"
    static let hint_password = "Contraseña"
    static let hint_new_password = "Escribe una contraseña"
    static let hint_confirm_pwssd = "Confirma la contraseña"
}

// MARK: - Error Messages
struct ErrorMessages {
    static let blankFields = "Por favor completa todos los campos para continuar"
    static let email = "Por favor revisa tu correo he inténtalo de nuevo"
    static let invalidEmail = "Por favor ingresa un correo valido he inténtalo de nuevo"
    static let failedDataUpdate = "Error al actualizar datos"
    static let fbCanceledLogin = "Inicio de sesión con Facebook cancelado"
    static let fbCanceledRegister = "Registro con Facebook cancelado"
    static let fbDeniedPermits = "Permisos denegados"
    static let loginTitle = "Error al ingresar"
    static let notLoggedIn = "No has iniciado sesión"
    static let pswNotMatch = "¡Las contraseñas no coinciden!"
    static let registerTitle = "Error al registrar"
    static let requiredField = "Por favor completa este campo para continuar"
    static let tryAgain = "Inténtalo de nuevo más tarde"
}
