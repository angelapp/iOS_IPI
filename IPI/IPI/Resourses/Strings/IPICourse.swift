//
//  IPICourse.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//
//
// Contiene todos los textos del curso
// El contenido, esta separado por Páginas del curso.

import Foundation

struct IPI_COURSE {

    static let MODULE_01 = "Conceptos Básicos de Protección Internacional"
    static let MODULE_02 = "La labor de los estados para brindar mejores condiciones de vida a las PNPI"
    static let MODULE_03 = "Conceptos Básicos de Protección Internacional"
    static let text1 = "¡Muy bien, respuesta correcta!"

    /** START MODULE 1 **/
    struct PAGE_01 {
        static let title = IPI_COURSE.MODULE_01
        static let text1 = "Te damos la bienvenida al Curso de Protección Internacional. Un curso que te ayudará a despejar inquietudes y aprender nuevos conceptos."
        static let text2 = "El curso está dividido en tres módulos a través de los cuales conocerás qué es la Protección Internacional, quién es y qué derechos tiene una Persona en Necesidad de Protección. Finalizarás el curso con un cuestionario que te ayudará a identificar si eres o no una Persona en Necesidad de Protección Internacional"
        static let text3 = "Inicia con ánimo este recorrido de aprendizaje."
    }

    struct PAGE_02 {
        static let text1 = "¿Qué es la Protección Internacional?"
        static let text2 = "Para iniciar es importante que primero aclaremos el siguiente concepto. "
        static let text3 = "¿Qué es un refugiado? "
        static let text4 = "\"De acuerdo con la Convención sobre el Estatuto de los Refugiados de las Naciones Unidas de 1951, un refugiado es una persona que debido a fundados temores de ser perseguida por motivos de raza, religión, nacionalidad, pertenencia a un determinado grupo social o por sus opiniones políticas, se encuentra fuera de su país y no puede o no quiere acogerse a la protección que este le ofrece. También son aquellas personas que por esos mismos hechos no cuentan con una nacionalidad y que por temor a ser perseguidos no quieran o no puedan regresar a su país de origen\"."
    }

    struct PAGE_03 {
        static let text1 = "Los Estados tienen la responsabilidad de proteger, es decir resguardar y amparar a sus ciudadanos en su vida, su honra, sus bienes y sus derechos fundamentales. Cuando el gobierno de un Estado no quiere o no puede brindar esta protección, las personas se ven forzadas a huir y buscar protección en otro Estado que pueda acogerlos, y es allí cuando se convierten en refugiados."
        static let text2 = "Así las cosas, la Protección Internacional se otorga cuando a las personas les es reconocido el estatus de refugiado; un reconocimiento que debe efectuarse ante las entidades migratorias del Estado que los acoge."
    }

    struct PAGE_04 {
        static let text1 = "La Protección Internacional deben ofrecerla los Estados adheridos a la Convención sobre el Estatuto de los Refugiados de las Naciones Unidas y al Protocolo de 1967. Sin embargo, la Oficina del Alto Comisionado de las Naciones Unidas para los Refugiados (ACNUR), tiene la misión de promover e incentivar la aplicación de los mecanismos de  Protección Internacional en todos los Estados, sean o no parte de la Convención y/o el Protocolo."
        static let text2 = "Para el caso de Latinoamérica existe además, un instrumento regional como la Declaración de Cartagena de 1984, en la cual los Estados adoptaron medidas para facilitar la aplicación de la Convención de 1951 y el Protocolo de 1967 en la región."
        static let text3 = "Encuentra los documentos mencionados en la opción \"Documentos\" de la sección Planea tu Viaje"
    }

    struct PAGE_05 {
        static let text1 = "¿Qué es una persona en necesidad de protección internacional (PNPI)?"
        static let text2 = "Te preguntarás entonces ¿qué personas necesitan Protección Internacional?"
        static let text3 = "Para obtener la respuesta, escucha el siguiente audio."
        static let text4 = "Y, ¿ante qué situaciones puede una persona pedir Protección Internacional?"
    }

    struct PAGE_06 {
        static let text1 = "Detengámonos un momento para responder a las siguientes preguntas:"
        static let text2 = "a) ¿De las causas que acabas de escuchar por las cuales una persona necesitaría Protección Internacional, una o varias se presentan actualmente en tu país de origen?"
        static let text3 = "b) Si es así, te has sentido desprotegido y has visto afectado tu bienestar y derechos fundamentales porque tu país no ha respondido de manera efectiva ante aquellos riesgos?"
        static let text4 = "c) ¿Los anteriores riesgos, son los motivos por los cuales has decidido salir de tu país?"
        static let text5 = "Si respondiste afirmativamente a las tres anteriores preguntas, ten en cuenta lo siguiente:"
        static let text6 = "Si tu país de origen no está en capacidad de protegerte, significa que definitivamente requieres protección por parte de otro u otro(s) país(es). Es decir: necesitas Protección Internacional."
        static let text7 = "Las causas por las cuales una persona puede ser considerada PNPI, pueden coincidir con las situaciones por las que a una persona le puede ser reconocida la condición de refugiada"
        static let text8 = "¿De qué depende? de la definición que las leyes de cada país tengan sobre la condición de persona refugiada."
        static let text9 = "Te invitamos a la sección Prepara tu viaje - Refugio para que conozcas la ruta que te mostrará cómo aplicar al estatus de refugiado en los distintos países."
    }

    struct PAGE_07 {
        static let text1 = "Veamos el siguiente ejemplo sobre la definición de Refugiado en tres distintos países:"

        static let header1 = "En Ecuador"
        static let boby1 = "En Ecuador, la Ley Orgánica de Movilidad Humana, artículo 98, establece que “Será reconocida como refugiada en el Ecuador toda persona que: Debido a temores fundamentados de ser perseguida por motivos de raza, religión, nacionalidad, pertenencia a determinado grupo social u opiniones políticas, que se encuentre fuera de su país de nacionalidad, y no pueda o quiera, a causa de dichos temores, acogerse a la protección de su país, o que, careciendo de nacionalidad y hallándose fuera del país donde antes tuviera su residencia habitual, no pueda o no quiera regresar a él."

        static let header2 = "En Perú"
        static let boby2 = "En Perú la Ley Nº 27891, Artículo 3º, define como refugiado a todos aquellos que cumplan con los requisitos de la Convención sobre el Estatuto de los Refugiados de 1951, “a la persona que se ha visto obligada a huir de su país de nacionalidad o de residencia habitual por causa de la violación masiva de los derechos humanos, agresión extranjera, conflicto interno, ocupación o dominación extranjera; o en razón de acontecimientos que perturben gravemente el orden público."

        static let header3 = "En Colombia"
        static let boby3 = "En Colombia, el Decreto 1067 de 2015, artículo 2.2.3.1.1.1. establece que el término refugiado se aplicará a toda persona que tenga “fundados temores de ser perseguida por motivos de raza, religión, nacionalidad, pertenencia a determinado grupo social u opiniones políticas, se encuentre fuera del país de su nacionalidad y no pueda o, a causa de dichos temores, no quiera acogerse a la protección de tal país; o que, careciendo de nacionalidad y hallándose, a consecuencia de tales acontecimientos, fuera del país donde antes tuviera su residencia habitual, no pueda o, a causa de dichos temores, no quiera regresar a él”. \(doubleJump)Que se hubiera visto obligada a salir de su país porque su vida, seguridad o libertad han sido amenazadas por violencia generalizada, agresión extranjera, conflictos internos, violación masiva de los Derechos Humanos u otras circunstancias que hayan perturbado gravemente al orden público; y que haya razones fundadas para creer que estaría en peligro de ser sometida a tortura u otros tratos o penas crueles, inhumanos o degradantes en caso de que se procediera a la expulsión, devolución o extradición al país de su nacionalidad o, en el caso que carezca de nacionalidad, al país de residencia habitual."

        static let header4 = "En Panamá"
        static let boby4 = "En Panamá el Decreto Ley 5 de 2018 establece que las personas pueden solicitar el refugio cuando “cumpla con los requisitos establecidos en el artículo 1ª de la Convención de 1951 y el Protocolo de 1967 sobre el Estatuto de los Refugiados…”"
    }
	
    struct PAGE_08 {
        static let text1 = "¿Qué derechos tienen las Personas en Necesidad de Protección Internacional (PNPI)?"
        static let text2 = "Bien, hasta el momento hemos visto el concepto de refugiado, qué es un PNPI o Persona en Necesidad de Protección Internacional, las causas por las cuales una persona necesitaría Protección Internacional y algunos ejemplos del marco jurídico que regula esta condición en Latinoamérica. Conozcamos ahora qué derechos tiene un PNPI según la Convención sobre el Estatuto de los Refugiados de 1951."
    }

    struct PAGE_09 {
        static let text1 = "Recuerda"
        static let text2 = "Estos derechos también están contemplados dentro de la Declaración de Derechos Humanos. Los Estados que acogen a las Personas en Necesidad de Protección Internacional, deben garantizar que su cumplimiento se de en el trato más favorable posible y tal como se brinda a los nacionales."
        static let text3 = "Un PNPI/Refugiado que conoce su situación jurídica, tendrá poder para actuar, para defenderse y para informar a personas que se encuentran en su misma situación. Es necesario mantenerse informado a través de fuentes oficiales y confiables. Así contribuirás a que la migración sea más segura, reduciendo los riesgos que se dan por la ignorancia y la falta de información, y que se convierten muchas veces en factores de conflicto."
        static let text4 = "Si eres un PNPI/Refugiado, ten presente que la falta de redes de apoyo en el nuevo entorno te hacen particularmente vulnerable; te enfrentarás con entornos diferentes y en algunos casos hostiles. El conocimiento de las leyes no implica necesariamente conocimiento de las culturas, formas de vida e incluso del funcionamiento de las entidades y quienes trabajan allí. "
        static let text5 = "Eres tú quien se está adaptando a un nuevo entorno; recuerda que una actitud abierta a la comprensión y al diálogo, te harán más asertivo a la hora de relacionarte con las personas y facilitará además, un conocimiento efectivo de las nuevas dinámicas que te rodean (legales, sociales, económicas, políticas, culturales)."
    }

    struct PAGE_10 {
        static let text1 = "¡Muy bien! Has finalizado el Módulo No. 1 de este curso."
        static let text2 = "Es el momento de que verifiques cuánto has aprendido. Desarrolla la siguiente actividad práctica para pasar al Módulo No. 2."
    }

    struct PAGE_11 {
        static let text1 = "Lee a continuación las siguientes situaciones y selecciona en los cuadros la respuesta que consideres correcta:"
        static let text2 = "Ana María ha decidido salir de su país porque hay graves perturbaciones al orden público, han muerto cientos de personas en manifestaciones y hay una hambruna generalizada. Pasó meses sin recibir ayuda alguna del Estado, porque éste no tiene la capacidad en el momento para atender las necesidades de la población. Ana María es:"
        static let option1 = "Una Persona en Necesidad de Protección Internacional."
        static let option2 = "Una persona inmigrante."
        static let option3 = "Una persona que puede salir y regresar a su país en cualquier momento."

        static let ERROR = "Recuerda que una persona se convierte en Persona en Necesidad de Protección Internacional cuando abandona su país de origen a causa de conflictos internos o internacionales, graves perturbaciones al orden público, violaciones masivas a los derechos humanos, violencia generalizada, o porque se siente perseguida por motivos de raza, religión, nacionalidad, pertenencia a un determinado grupo social o por sus opiniones políticas. Además porque su Estado no puede o no quiere brindarle protección ni garantizar sus derechos."
    }

    struct PAGE_12 {
        static let text1 = "César y Mariana escaparon a Macarapá, un país vecino en donde se encuentran viviendo hace dos meses; allí tuvieron a su bebé Gabriela. Ninguno de los dos tiene una condición migratoria regular razón por la cual la bebé no ha sido registrada ni reconocida como ciudadana de Macarapá. Ellos temen ir al consulado de su país a registrarla ya que debieron escapar a causa del conflicto interno que allí se vive. Sin documentos Gabriela no puede acceder a ningún servicio social, por tanto ella es:"
        static let option1 = "Una mujer a quien le gusta la aventura"
        static let option2 = "Una persona inmigrante en condiciones ilegales."
        static let option3 = "Una persona apátrida que debe recibir Protección Internacional de inmediato."

        static let ERROR = "Revisa el concepto de Apatridia, visto durante el Módulo 1."
    }

    struct PAGE_13 {
        static let text1 = "¡Felicitaciones! Ya tienes claros los conceptos básicos de la Protección Internacional y has obtenido tu primeria insignia."
        static let text2 = "¿Quieres revisar nuevamente los contenidos de este módulo?"
    }
    /** END MODULE 1 **/

    /** START MODULE 2 **/
    struct PAGE_14 {
        static let title = "Antes de comenzar"
		static let text1 = "Ya conociste los conceptos básicos de la Protección Internacional. Para iniciar el Módulo No. 2 veamos tres pilares del sistema de las Naciones Unidas, contemplados dentro de la Convención sobre el Estatuto de los Refugiados, que deben tener en cuenta los Estados cuando acogen a las PNPI/Refugiados."
    }

    struct PAGE_15 {
		static let text1 = "Antes de comenzar ..."
		static let text2 = "Ya conociste los conceptos básicos de la Protección Internacional. Para iniciar el Módulo No. 2 veamos tres pilares del sistema de las Naciones Unidas, contemplados dentro de la Convención sobre el Estatuto de los Refugiados, que deben tener en cuenta los Estados cuando acogen a las PNPI/Refugiados."

		static let slide0_title = "Principio de la no discriminación"
		static let slide0_text  = "\"Garantía de igualdad de trato entre los individuos sean o no de una misma comunidad, país o región\". En este sentido, la Protección Internacional es un derecho en sí mismo."

		static let slide1_title = "Principio de no devolución"
		static let slide1_text  = "\"Ningún estado podrá, por expulsión o devolución, poner a un refugiado en las fronteras de los  territorios donde su vida o libertad peligre por causa de su raza, religión, nacionalidad, pertenencia a un grupo social u opiniones políticas.\""

		static let slide2_title = "Estancia irregular en un Estado"
		static let slide2_text  = "\"No se impondrá sanción alguna al solicitante de refugio que ingrese o se encuentre ilegalmente al país, toda vez que provenga de un territorio donde su vida esté amenazada.\""
    }

    struct PAGE_16 {
		static let text5_1 = "Ahora si, es momento de conocer cuál es la labor que llevan a cabo los Estados para brindar mejores condiciones de vida a las Personas en Necesidad de Protección Internacional. Veamos, lo que específicamente se hace en la región de América Latina y el Caribe."
		static let text5_2 = "Presta mucha atención al siguiente video."
    }

    struct PAGE_17 {
    }

    struct PAGE_18 {
    }

    struct PAGE_19 {
    }

    struct PAGE_20 {
    }

    struct PAGE_21 {
    }

    struct PAGE_22 {
    }

    struct PAGE_23 {
    }

    struct PAGE_24 {
    }

    struct PAGE_25 {
    }

    struct PAGE_26 {
    }

    struct PAGE_27 {
    }

    struct PAGE_28 {
    }

    struct PAGE_29 {
    }
}
