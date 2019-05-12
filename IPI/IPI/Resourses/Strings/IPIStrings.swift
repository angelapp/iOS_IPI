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
let doubleJump = "\n\n"
let subject = "Subject"
let titleTextColor = "titleTextColor"
let resetButtonTitle = "Reiniciar Curso"

let URL_GENERAL_SETTINGS = "App-Prefs:root=General"
let URL_LOCATION_SERVICES = "App-Prefs:root=LOCATION_SERVICES"
let URL_WIFI_SETTINGS = "App-Prefs:root=WIFI"

let ID_cliente_Google = "773365250219-f2l0oelfvnsh3ansn3h6o8ur2r3ugh4h.apps.googleusercontent.com"


// MARK: - AVATAR, CONFIG
struct AvatarStrings {
    static let title = "Arma tu Conse"
    static let message = "El Consejero o Consejera es una persona que te acompañará mientras estés usando la aplicación. Inicia seleccionando si quieres que sea hombre o mujer y luego define sus rasgos físicos y accesorios."
    static let uploadSuccess = "Avatar guardado satisfactoriamente!"
    static let letStartMessage = "Hola soy tu Conse y voy a estar acompañándote en este recorrido. Traigo mucha información y herramientas que me gustaría compartir contigo"
    static let letStartTitle = "¡Iniciemos!"
}

// MARK: - Buttons
struct Buttons {
    static let accept = "Aceptar"
    static let avatar_Male = "Conse Hombre"
    static let avata_Female = "Conse Mujer"
    static let end = "FINALIZAR"
    static let forgot = "¿Olvidaste la contraseña?"
    static let login = "O inicia sesión"
    static let next = "SIGUIENTE"
    static let ready = "Listo"
    static let send = "Enviar"
    static let signin = "Ingresar"
    static let signup = "Regístrate"
    static let skip = "SALTAR"
    static let start = "¡Iniciemos!"
}

// MARK: - Lables
struct Labels {
    static let create_account = "Crea tu cuenta"
    static let login_title = "Ingresa tus datos"
    static let welcome = "Te damos la bienvenida a:"

    static let hint_email = "Correo electrónico"
    static let hint_password = "Contraseña"
    static let hint_new_password = "Escribe una contraseña"
    static let hint_confirm_pwssd = "Confirma la contraseña"
    static let hint_contact_message = "Escribe aquí tu mensaje"
    static let hint_kindofMessage = "Seleccione..."

    static let contact_kindOfMessage = "Tipo de mensaje"
    static let contact_messageTitle = "Tu mensaje"
    static let contact_telephone = "Tú Teléfono"
    static let contact_title = "DÉJANOS TU MENSAJE"
}

// MARK: - Error Messages
struct ErrorMessages {
    static let blankFields = "Por favor completa todos los campos para continuar"
    static let completeInformation = "Debe completar información"
    static let email = "Por favor revisa tu correo he inténtalo de nuevo"
    static let invalidEmail = "Correo no válido"
    static let failedDataUpdate = "Error al actualizar datos"
    static let fbCanceledLogin = "Inicio de sesión con Facebook cancelado"
    static let fbCanceledRegister = "Registro con Facebook cancelado"
    static let fbDeniedPermits = "Permisos denegados"
    static let loginTitle = "Error al ingresar"
    static let missingAvatarSelection = "Falta seleccionar una parte del ávatar"
    static let notLoggedIn = "No has iniciado sesión"
    static let pswNotMatch = "¡Las contraseñas no coinciden!"
    static let registerTitle = "Error al registrar"
    static let requiredField = "Debes diligenciar este campo"
    static let tryAgain = "Inténtalo de nuevo más tarde"
}

// MARK: - String for loader
struct LoaderStrings {
    static let avatarUpload = "Guardando avatar..."
    static let configApp = "Obteniendo configuración de la aplicación"
    static let download = "Descargando..."
    static let loading = "Cargando..."
    static let login = "Autenticando usuario..."
    static let recording = "Guardando..."
    static let recovery = "Recuperando contraseña..."
    static let sendEmail = "Enviando email ..."
    static let signup = "Registrando usuario..."
}

// MARK: - Website
struct WebsiteURL {
    static let office = "http://www.nrc.org.co/directorio-oficinas-nrc/"
    static let facebook = "https://www.facebook.com/consejonoruegopararefugiados/"
    static let twitter = "https://twitter.com/NRC_LAC"
    static let nrc = "http://www.nrc.org.co/"
    static let ipi = "https://ipi.conse.co/"

    static let hasHTTPProtocol = "http"
    static let httpProtocol = "http://"
}

/// Id's de los videos en Youtube!
struct VideosID {
    static let DEFAULT_VIDEO = "KuUWKzD8e00"
    static let PROTECTION_VIDEO = "7t0rIdNhayM"
}

// MARK: - Formats
/// Formatos de fecha
struct DateTimeFormat {
    static let formatByZone = "yyyy-MM-dd'T'HH:mm:ssXXX"
    static let formatInMillis = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let formatInMillisZone = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"

    static let shortDateFormat = "dd/MM"
    static let shortTimeFormat = "HH:mm"
    static let commonDateFormat = "dd/MM/yyyy"
    static let sendDateFormat = "yyyy-MM-dd"
}

/// Formatos, y Expresiones regulares
struct Formats {
    static let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let matchesFormat = "SELF MATCHES %@"
    static let contactMessage = "Email: %@ \n\n Teléfono: %@ \n\n Mensaje: %@"
    static let youtubeEmbedFormat = "https://www.youtube.com/embed/%@"
}
