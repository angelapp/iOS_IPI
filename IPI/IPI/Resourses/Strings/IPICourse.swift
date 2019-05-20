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
    
    struct PAGE_01 {
        static let title = IPI_COURSE.MODULE_01
        static let text1 = "Te damos la bienvenida al Curso de Protección Internacional. Un curso que te ayudará a despejar inquietudes y aprender nuevos conceptos."
        static let text2 = "El curso está dividido en tres módulos a través de los cuales conocerás qué es la Protección Internacional, quién es y qué derechos tiene una Persona en Necesidad de Protección. Finalizarás el curso con un cuestionario que te ayudará a identificar si eres o no una Persona en Necesidad de Protección Internacional"
        static let text3 = "Inicia con ánimo este recorrido de aprendizaje."
    }
    
    struct PAGE_02 {
        static let title = "Módulo 1. \(IPI_COURSE.MODULE_01)"
        static let text1 = "¿Qué es la Protección Internacional?"
        static let text2 = "Para iniciar es importante que primero aclaremos el siguiente concepto. "
        static let text3 = "¿Qué es un refugiado? "
        static let text4 = "\"De acuerdo con la Convención sobre el Estatuto de los Refugiados de las Naciones Unidas de 1951, un refugiado es una persona que debido a fundados temores de ser perseguida por motivos de raza, religión, nacionalidad, pertenencia a un determinado grupo social o por sus opiniones políticas, se encuentra fuera de su país y no puede o no quiere acogerse a la protección que este le ofrece. También son aquellas personas que por esos mismos hechos no cuentan con una nacionalidad y que por temor a ser perseguidos no quieran o no puedan regresar a su país de origen\"."
    }
	
	struct PAGE_03 {
        static let title = "Módulo 1. \(IPI_COURSE.MODULE_01)"
	    static let text1 = "Los Estados tienen la responsabilidad de proteger, es decir resguardar y amparar a sus ciudadanos en su vida, su honra, sus bienes y sus derechos fundamentales. Cuando el gobierno de un Estado no quiere o no puede brindar esta protección, las personas se ven forzadas a huir y buscar protección en otro Estado que pueda acogerlos, y es allí cuando se convierten en refugiados."
		static let text2 = "Así las cosas, la Protección Internacional se otorga cuando a las personas les es reconocido el estatus de refugiado; un reconocimiento que debe efectuarse ante las entidades migratorias del Estado que los acoge."
	}
	
	struct PAGE_04 {
        static let title = "Módulo 1. \(IPI_COURSE.MODULE_01)"
	    static let text1 = "La Protección Internacional deben ofrecerla los Estados adheridos a la Convención sobre el Estatuto de los Refugiados de las Naciones Unidas y al Protocolo de 1967. Sin embargo, la Oficina del Alto Comisionado de las Naciones Unidas para los Refugiados (ACNUR), tiene la misión de promover e incentivar la aplicación de los mecanismos de  Protección Internacional en todos los Estados, sean o no parte de la Convención y/o el Protocolo."
		static let text2 = "Para el caso de Latinoamérica existe además, un instrumento regional como la Declaración de Cartagena de 1984, en la cual los Estados adoptaron medidas para facilitar la aplicación de la Convención de 1951 y el Protocolo de 1967 en la región."
		static let text3 = "Encuentra los documentos mencionados en la opción \"Documentos\" de la sección Planea tu Viaje"
	}
	
	struct PAGE_05 {
        static let title = "Módulo 1. \(IPI_COURSE.MODULE_01)"
	    static let text1 = "¿Qué es una persona en necesidad de protección internacional (PNPI)?"
		static let text2 = "Te preguntarás entonces ¿qué personas necesitan Protección Internacional?"
		static let text3 = "Para obtener la respuesta, escucha el siguiente audio."
		static let text4 = "Y, ¿ante qué situaciones puede una persona pedir Protección Internacional?"
	}
	
	struct PAGE_06 {
        static let title = "Módulo 1. \(IPI_COURSE.MODULE_01)"
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
        static let title = "Módulo 1. \(IPI_COURSE.MODULE_01)"
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
}
