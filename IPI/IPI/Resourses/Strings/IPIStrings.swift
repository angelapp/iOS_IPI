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
    static let basic_Concepts = "Conceptos básicos de\(jumpLine)protección internacional"
    static let begin = "Iniciar"
    static let carry_on = "¡Adelante!"
	static let come_back = "VOLVER"
    static let end = "FINALIZAR"
	static let end_course = "Finalizar"
    static let facebook = "Continuar con Facebook"
    static let forgot = "¿Olvidaste la contraseña?"
    static let google = "Acceder con Google"
    static let go_activity = "Ir a la actividad"
    static let login = "O inicia sesión"
    static let next = "SIGUIENTE"
    static let plan_your_trip = "Prepara tu viaje"
    static let ready = "Listo"
    static let send = "Enviar"
    static let signin = "Ingresar"
    static let signup = "Regístrate"
    static let skip = "SALTAR"
    static let start = "¡Iniciemos!"
    static let try_again = "Vuelve a intentarlo"
}

// MARK: - Images
struct IPI_IMAGES {
    static let selectActivitiesImage = "ilustracion"

    static let admiration = "admiracion"
    static let corner_BLUE = "esquina_azul"
    static let corner_PINK = "esquina_rosada"
    static let corner_YELLOW = "bocadillo"
    static let check = "checkbox"
    static let check_hover = "checkboxSelec"
    static let fail = "error"
    static let icon_1 = "1"
    static let icon_2 = "2"
    static let icon_3 = "3"
	static let icon_4 = "4"
	static let icon_5 = "5"
	static let btn_acordeon_open = "btn_acordeon_abrir"
	static let btn_acordeon_close = "btn_acordeon_cerrar"
    static let btn_back_yellow = "btn_back_yellow"
    static let btn_back_red = "btn_back_red"
    static let achievement_module_1 = "insignia_1"
    static let progress_logo = "insignia"
    static let progress_advanced = "avanzado"
    static let progress_expert = "experto"
    static let progress_connoisseur = "conocedor"
    static let sheet_top = "bolitas"
    static let success = "chulo_azul"
    static let speaker_blue = "btn_audio"
    static let speaker_blue_hover = "btn_audio_hover"
    static let speaker_orange = "btn_bocina"
    static let speaker_orange_hover = "btn_bocina_hover"
	static let infografia_M1_07 = "infografia_completa"
}

// MARK: - Lables
struct Labels {
    static let create_account = "Crea tu cuenta"
    static let login_title = "Ingresa tus datos"
    static let welcome = "Te damos la bienvenida a:"
    
    static let before_travel_title = "Antes de tu viaje, ten encuenta la siguiente información"
    static let before_travel_text1 = "¿Qué es la condición migratiora?"
    static let before_travel_text2 = "¿Qué es el estatus de refugiado?"
    static let before_travel_text3 = "¿Te quedarás temporalmente o estás en tránsito?"
    static let before_travel_text4 = "¿Quieres permanecer de forma permanente en el país de destino?"

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
    static let contact_send_message = "Se ha enviado tu mensaje"

    static let listenAudio = "Escucha el audio"
    
    static let progress_message = "Pulsa sobre cada ícono para volver al inicio de cada módulo"
    static let progress_title = "MI PROGRESO"
    static let progress_toast_message = "Para poder ver el módulo seleccionado primero debes haber completado los módulos anteriores"
}

// MARK: - Error Messages
struct ErrorMessages {
    static let audioNotFound = "No se encuentra el archivo"
    static let audioDontLoad = "No se pudo cargar el Audio"
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
