//
//  About_NRC.swift
//  IPI
//
//  Created by Felipe Zamudio on 06/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

struct AboutNRC {

    struct Page_01 {

        static let paragraph_1 = "Somos una organización no gubernamental internacional, independiente, humanitaria, sin ánimo de lucro, establecida en 1946. Respondemos durante situaciones de conflicto armado y nos comprometemos en otros contextos donde nuestras competencias provean un valor añadido. Estamos presentes en 30 países alrededor del mundo. \(doubleJump)Promovemos la resiliencia y la participación de las personas desplazadas y refugiadas en el diseño y ejecución de programas. Proveemos asistencia alimentaria, agua potable, albergue, asistencia legal y educación. En situaciones de emergenica nuestra Unidad de Respuesta Rápida está preparada para complementar la respuesta del Estado. \(doubleJump)Valores NRC \(jumpLine)Estamos comprometidos con nuestros valores centrales:"

        static let inBold_1 = "Unidad de Respuesta Rápida"
        static let inBold_2 = "Valores NRC"

        static let item_1 = "Dedicación"
        static let item_2 = "Inclusión"
        static let item_3 = "Innovación"
        static let item_4 = "Rendición de cuentas"
    }

    struct Page_02 {

        static let text_1 = "Ofrecemos una respuesta de alta calidad donde hay mayores necesidades a través de nuestras competencias en: \(doubleJump)Educación"
        static let text_2 = "Aseguramos que la población afectada por el conflicto continúe aprendiendo y preparamos el camino para una educación de calidad.\(doubleJump)Asistencia Legal"
        static let text_3 = "Promovemos la protección de personas que se ven obligadas a huir de sus hogares y se enfrentan a violaciones de los derechos humanos.\(doubleJump)Alojamiento e infraestructura"
        static let text_4 = "Promovemos el acceso a espacios seguros para familias que se ven obligadas a huir de sus hogares"

        static let inBold_1 = "Educación"
        static let inBold_2 = "Asistencia Legal"
        static let inBold_3 = "Alojamiento e infraestructura"
    }

    struct Page_03 {

        static let text_1 = "En Colombia, estamos presentes en 11 departamentos: Arauca, Caquetá, Cauca, Chocó, Guajira, Magdalena, Meta, Nariño, Norte de Santander, Cesar y Guaviare. Nuestra Unidad de Respuesta Rápida tiene el potencial de brindar asistencia en cualquier parte del territorio donde la situación humanitaria lo requiera.\(doubleJump)Brindamos respuesta humanitaria a través de 12 oficinas en Colombia y 9 oficinas en América Latina: Panamá, Venezuela, Ecuador y Honduras."
        static let text_2 = "Conoce nuestras oficinas"
        static let href_2 = Social.href_office
    }

    struct Social {

        static let copy_facebook = "Consejo Noruego para Refugiados"
        static let copy_twitter = "@NRC_LAC"
        static let copy_webpage = "Más información en nuestro sitio web"
        static let copy_ipiwebpage = "Ingresa a la página web de IPI"

        static let href_office = "http://www.nrc.org.co/directorio-oficinas-nrc/"
        static let href_facebook = "https://www.facebook.com/consejonoruegopararefugiados/"
        static let href_twitter = "https://twitter.com/NRC_LAC"
        static let href_webpage = "http://www.nrc.org.co/"
        static let href_ipiwebpage = "http://ipi.conse.co/"
    }

    enum LinkID: Int {
        case facebook, office, twitter
        case ipiWebpage, conseWebpage
    }

    struct Images {
        static let photo_housing = "foto_alojamiento"
        static let photo_assistance = "foto_asistencia"
        static let photo_education = "foto_educacion"
        static let photo_map = "foto_mapa"
        static let photo_whoes = "foto_quienes"
    }
}
