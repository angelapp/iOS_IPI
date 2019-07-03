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
let debugFlag = "IPI_debug_message: "

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
    static let done = "Entendido"
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

    static let achievement_module_1 = "insignia_1"
    static let achievement_module_2 = "insignia_2"
    static let achievement_module_3 = "insignia_3"
    static let admiration = "admiracion"
    static let btn_acordeon_open = "btn_acordeon_abrir"
    static let btn_acordeon_close = "btn_acordeon_cerrar"
    static let btn_audio = "btn_audio"
    static let btn_audio_hover = "btn_audio_hover"
    static let btn_back_yellow = "btn_back_yellow"
    static let btn_back_red = "btn_back_red"
    static let btn_back_green = "btn_back_green"
    static let btn_play = "btn_reproducir"
    static let btn_play_hover = "btn_reproducir_hover"
    static let btn_data = "btn_datos_utiles"
    static let btn_basic_rights = "btn_derechos_basicos"
    static let btn_phonebook = "btn_directorio"
    static let btn_documents = "btn_documentos"
    static let btn_migration_requirements = "btn_requisitos_mig"
    static let btn_nationalization_requirements = "btn_requisitos_nacionalizacion"
    static let btn_refuge_request = "btn_solicitud_refugio"
    static let btn_visa = "btn_visas"

    static let avatar = "avatar"
    static let btn_change_countries = "btn_change_countries"
    static let btn_download = "btn_download"
    static let btn_download_hover = "btn_download_hover"
    static let btn_lisent = "btn_lisent"
    static let btn_lisent_hover = "btn_lisent_hover"
    static let btn_progress = "btn_avance"
    static let btn_share = "btn_share"
    static let btn_share_hover = "btn_share_hover"
    static let btn_save_query = "btn_save_query"
    static let btn_suggestions = "btn_suggestions"
    static let bubble_audio = "bubble_audio"
    static let icon_arrow = "icon_arrow"
    static let icon_autoridad = "icon_autoridad"
    static let icon_conversion = "icon_conversion"
    static let icon_datos = "icon_datos"
    static let icon_derechos = "icon_derechos"
    static let icon_directorio = "icon_directorio"
    static let icon_documentos = "icon_documentos"
    static let icon_google_maps = "icon_google_maps"
    static let icon_llamada_exterior = "icon_llamada_exterior"
    static let icon_llamada_local = "icon_llamada_local"
    static let icon_marker = "icon_marker"
    static let icon_mobile = "icon_mobile"
    static let icon_moneda = "icon_moneda"
    static let icon_person = "icon_person"
    static let icon_pin = "icon_pin"
    static let icon_requisitos = "icon_requisitos"
    static let icon_resquisitos_nac = "icon_resquisitos_nac"
    static let icon_solicitud = "icon_solicitud"
    static let icon_visas = "icon_visas"

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
    static let infografia_M1_07 = "infografia_completa"
    static let progress_logo = "insignia"
    static let progress_advanced = "avanzado"
    static let progress_expert = "experto"
    static let progress_connoisseur = "conocedor"
    static let sheet_top = "bolitas"
    static let slider_logo = "principios"
    static let speaker_blue = "btn_audio"
    static let speaker_blue_hover = "btn_audio_hover"
    static let speaker_orange = "btn_bocina"
    static let speaker_orange_hover = "btn_bocina_hover"
    static let success = "chulo_azul"
    static let success_orange = "chulo_naranja"
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
    static let hint_spinner = "Selecciona"

    static let contact_kindOfMessage = "Tipo de mensaje"
    static let contact_messageTitle = "Tu mensaje"
    static let contact_telephone = "Tú Teléfono"
    static let contact_title = "DÉJANOS TU MENSAJE"
    static let contact_send_message = "Se ha enviado tu mensaje"

    static let listenAudio = "Escucha el audio"
    static let listenAudioRefugeRequest = "PULSA PARA ESCUCHAR"

    static let progress_message = "Pulsa sobre cada ícono para volver al inicio de cada módulo"
    static let progress_title = "MI PROGRESO"
    static let progress_toast_message = "Para poder ver el módulo seleccionado primero debes haber completado los módulos anteriores"

    static let select_your_destination = "¿Cuál es tu destino?"
    static let select_your_nationality = "¿Cuál es tu nacionalidad?"

    // Suggestions for your trip
    static let suggestions_title = "Recomendaciones para tu protección"
    static let suggestions_text = "Al salir de tu país de origen y dirigirte a un país desconocido, es probable que debas enfrentarte a diversas situaciones que pueden poner en riesgo tu bienestar y el de las personas que viajen contigo. Consulta a continuación algunas recomendaciones para tu protección."

    //Titles for plan your trip
    static let migration_requirements  = "REQUISITOS \nMIGRATORIOS"
    static let country_general_data = "DATOS ÚTILES \nDE %@"
    static let basic_rights = "DERECHOS \nBÁSICOS "
    static let refuge_request  = "SOLICITUD \nDE REFUGIO"
    static let visa = "VISAS"
    static let nationalization_requirements = "REQUISITOS DE \nNACIONALIZACIÓN"
    static let phonebook = "DIRECTORIO"
    static let documents = "DOCUMENTOS"

    static let remind = "Recuerda..."

    static let saveQuery_format = "Acabas de guardar la información disponible para el trayecto %@ - %@. \(doubleJump) Puedes consultarla más tarde en la opción del menú ÚLTIMA CONSULTA."
}

// MARK: - Error Messages
struct ErrorMessages {
    static let audioNotFound = "No se encuentra el archivo"
    static let audioDontLoad = "No se pudo cargar el Audio"
    static let blankFields = "Por favor completa todos los campos para continuar"
    static let completeInformation = "Debe completar información"
    static let disabledAction = "El dispositivo no puedo realizar esta acción."
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
    static let unselectOption = "Debes responder para continuar"
    static let unsavedPlan = "No has guardado ninguna consulta aún"
    static let tryAgain = "Inténtalo de nuevo más tarde"
    static let dataNotFound = "¡No se encontraron archivos!"
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
    static let callFormat = "tel://%@"
    static let cssStyles = "<style> html * {font-size: 12pt; color: #004058; font-family: Roboto;} a {color: #FF7602;} </style>"
    static let cssItalicStyles = "<style> html * {font-size: 12pt; color: #004058; font-family: Roboto; font-style: italic;} a {color: #FF7602;} </style>"
    static let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let matchesFormat = "SELF MATCHES %@"
    static let contactMessage = "Email: %@ \n\n Teléfono: %@ \n\n Mensaje: %@"
    static let youtubeEmbedFormat = "https://www.youtube.com/embed/%@"
    static let bodyEmailShare = "Plantilla %@"
    static let migrationRequirementFormat = "Lista de chequeo para tu viaje a %@"
    static let refugeRequestFormat = "Si eres una persona refugiada ó en necesidad de protección internacional, esta es la ruta que deberás seguir para regular tu condición en territorio %@"
    static let selectCityFormat = "Selecciona la ciudad en %@"
    static let phonebookFormat = "DIRECTORIO DE ENTIDADES \nDE APOYO EN %@"
	static let visasFormat = "Consulta a continuación las clases de visas a las que puedes acceder en %@ y los requisitos para cada una de ellas."
    static let nationalizationFormat = "Son %@ por nacimiento:"
}
