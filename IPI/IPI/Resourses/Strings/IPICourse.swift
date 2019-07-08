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
    static let SUCCEED_ANSWER = "¡Muy bien, respuesta correcta!"
    static let SUCCEED_FILL_WORD = "¡Lo has logrado!"
    static let OPTION_YES = "SI"
    static let OPTION_NOT = "NO"

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
		static let text1 = "Ahora si, es momento de conocer cuál es la labor que llevan a cabo los Estados para brindar mejores condiciones de vida a las Personas en Necesidad de Protección Internacional. Veamos, lo que específicamente se hace en la región de América Latina y el Caribe."
		static let text2 = "Presta mucha atención al siguiente video."
    }

    struct PAGE_17 {
        static let text1 = "En resumen:"
        static let text2 = "Los Estados latinoamericanos por medio de la Declaración de Cartagena de 1984 y los Planes de acción para su implementación han buscado: "
        static let text3 = "Mejorar la Protección Internacional de las personas refugiadas y solicitantes de asilo en América Latina y el Caribe. "
        static let text4 = "Crear soluciones integrales, complementarias y sostenibles de acuerdo con la Convención sobre el Estatuto de los Refugiados de 1951 y su Protocolo."
        static let text5 = "Concertar programas como el Asilo de Calidad, Fronteras Seguras, Repatriación Voluntaria, Reasentamiento y Movilidad Laboral para responder a nuevas realidades que se enfrentan en la región."
    }

    struct PAGE_18 {
        static let text1 = "¡Felicitaciones! Has completado los contenidos del Módulo 2. Pon a prueba tus conocimientos con el siguiente juego de letras."
        static let text2 = "Completa el nombre de seis de los programas propuestos por el Plan de Acción Brasil mencionados en el video. Lee las preguntas e ingresa las letras que hacen falta para completar las palabras."
    }
    
    struct PAGE_19 {
        static let text1 = "Pregunta 1"
        static let text2 = "Programa que busca fortalecer la capacidad de los Estados para acoger a los PNPI y mejorar los procedimientos para acceder a la condición de Refugiado."
        
        static let ANSWER = "ASILO DECALIDAD"
        static let ERROR = "Mira nuevamente el video del Módulo 2 y así recordarás la propuesta del Plan de Acción Brasil para apoyar los procedimientos de asilo para refugiados."
    }

    struct PAGE_20 {
        static let text1 = "Pregunta 2"
        static let text2 = "Programa que promueve la cooperación entre Estados para garantizar a un PNPI/Refugiado que pueda regresar a su país de origen."
        
        static let ANSWER = "REPATRIACIONVOLUNTARIA"
        static let ERROR = "Mira nuevamente el video del Módulo 2 para recordar la propuesta del Plan de Acción Brasil con la cual fortalecen la repatriación de refugiados."
    }

    struct PAGE_21 {
        static let text1 = "Pregunta 3"
        static let text2 = "Programa que refuerza la presencia de entidades en las áreas fronterizas y capacita a sus funcionarios."
        
        static let ANSWER = "FRONTERASSOLIDARIAS"
        static let ERROR = "Revisa nuevamente el video del Módulo 2 para recordar el programa del Plan de Acción Brasil que fortalece el movimiento de refugiados en las fronteras."
    }

    struct PAGE_22 {
        static let text1 = "Pregunta 4"
        static let text2 = "Programa que apoya a los PNPI/Refugiados cuando deber ser reubicados en un tercer país que les brindará mejores condiciones, e incluso la residencia permanente."
        
        static let ANSWER = "REASENTAMIENTOSOLIDARIO"
        static let ERROR = "Mira nuevamente el video del Módulo 2 para recordar el programa del Plan de Acción Brasil que apoya el reasentamiento de refugiados en países alternos."
    }

    struct PAGE_23 {
        static let text1 = "Pregunta 5"
        static let text2 = "Programa que facilita la integración de los refugiados en la sociedad del país que los acoge: económica, social y legalmente."
        
        static let ANSWER = "INTEGRACIONLOCAL"
        static let ERROR = "Mira nuevamente el video del Módulo 2 para recordar el programa del Plan de Acción Brasil que ayuda a los refugiados a integrarse a nivel local."
    }

    struct PAGE_24 {
        static let text1 = "Pregunta 6"
        static let text2 = "Programa que busca identificar los perfiles profesionales de los refugiados y las necesidades laborales en el país de destino."
        
        static let ANSWER = "MOVILIDADLABORAL"
        static let ERROR = "Mira nuevamente el video del Módulo 2 para recordar el programa del Plan de Acción Brasil que ayuda a los refugiados a ubicarse laboralmente."
    }

    struct PAGE_25 {
        static let text1 = "Ya tienes claros los programas que ofrecen los Estados de América Latina y el Caribe para las Personas en Necesidad de Protección Internacional. Has conseguido tu segunda insignia."
        static let text2 = "¿Quieres revisar nuevamente los contenidos de este módulo?"
    }
    /** END MODULE 2 **/
    
    /** START MODULE 3 **/
    struct PAGE_26 {
        static let text1 = "Hemos hecho un recorrido hasta el momento sobre los conceptos básicos de la Protección Internacional, los derechos que tiene una PNPI/Refugiado, las obligaciones de los Estados, pero nos falta lo más importante: reconocer si eres o no una persona que necesita Protección Internacional."
        static let text2 = "A lo largo del Módulo No. 3, encontrarás una serie de preguntas y observaciones que te ayudarán a identificar si eres o no una PNPI."
    }

    struct PAGE_27 {
        static let text1 = "¿Te encuentras fuera de tu país?"
        static let text2 = "Lo primero a tener en cuenta es que para solicitar refugio debes estar fuera de tu país; si aún te encuentras allí, cualquier otro Estado asumirá que tu gobierno puede darte protección y que por lo tanto no es necesaria la Protección Internacional."
    }

    struct PAGE_28 {
        static let text1 = "¿Tienes un temor fundado a sufrir persecución dentro de tu país?"
        static let text2 = "Antes de responder, te invitamos a escuchar con atención los audios que se encuentran en esta página para establecer las diferencias entre persecución, discriminación y castigo."
        static let text3 = "Persecución"
        static let text4 = "Discriminación"
        static let text5 = "Castigo"
    }

    struct PAGE_29 {
        static let text1 = "¿Los motivos que te llevan a sentir un temor fundado a ser perseguido están relacionados con tu raza, religión, nacionalidad, pertenencia a determinado grupo social u opiniones políticas?"
        static let text2 = "Para responder, ten en cuenta lo siguiente:"
        
        static let header_01 = "Raza"
        static let boby_01 = "Has sido discriminado por pertenecer a un grupo étnico: una de las violaciones más comunes a los derechos humanos, que puede conllevar al establecimiento de barreras raciales."
        
        static let header_02 = "Religión"
        static let boby_02 = "Has sufrido de discriminación por tus prácticas religiosas o por pertenecer a una determinada comunidad, violándote el derecho a la libertad de pensamiento, conciencia y religión."
        
        static let header_03 = "Nacionalidad"
        static let boby_03 = "Has sido perseguido por tu ciudadanía o, porque perteneces a una minoría nacional (étnica o lingüística). En algunas situaciones, una disputa entre grupos nacionales puede mezclarse con movimientos políticos, por ejemplo cuando un movimiento político se identifica con una “nacionalidad” determinada."
        
        static let header_04 = "Pertenencia a un grupo social"
        static let boby_04 = "Has sufrido persecución por pertenecer a un grupo de personas con antecedentes, costumbres o condición social similares, que causan desconfianza en los poderes públicos o que por sus opiniones políticas o económicas son un obstáculo para la política gubernamental."
        
        static let header_05 = "Opiniones políticas"
        static let boby_05 = "Has sido perseguido por tus opiniones políticas (las hayas expresado públicamente o no),  situación que te ha puesto en conflicto con las autoridades. O has sido objeto de enjuiciamiento o castigo, por un delito político, ó por actos con una motivación política."
    }
    
    struct PAGE_30 {
        static let text1 = "¿A causa de ese temor fundado NO puedes o NO quieres acogerte a la protección de tu país?"
        static let text2 = "Responde, a partir de la siguiente información:"
        static let text3 = "Según el Manual de procedimientos de ACNUR:"
        static let text4 = "Una persona no recibe protección de su país de origen debido a “circunstancias ajenas” a su voluntad. Estas circunstancias pueden presentarse por disturbios graves que alteran el orden público o causan violencia generalizada, porque existe una guerra civil o un conflicto interno o internacional que impiden que el Estado brinde protección a sus ciudadanos o que incluso “niegue su protección“. Estas razones pueden confirmar o reforzar los temores de la persona a ser perseguida. (Párrafo 98)"
        static let text5 = "Cuando una persona no quiere o se niega a aceptar la protección de las autoridades del país de su nacionalidad, debe ser porque presenta temores fundados que atentan contra su vida o su bienestar, que así lo justifican. Si la persona se niega a recurrir a la protección de su país de origen y “no hay motivos basados en fundados temores para rehusarla” se considera que no necesita la protección internacional y no es un refugiado. (Párrafo 100)"
    }
    
    struct PAGE_31 {
        static let text1 = "¿Te viste obligado a abandonar tu país de origen porque tu vida, seguridad o libertad estaban amenazadas por la violencia generalizada, agresión extranjera, conflictos internos, violación masiva de los derechos humanos u otras circunstancias que hayan perturbado gravemente el orden público?"
        static let text2 = "Escucha los siguientes audios:"
        static let text3 = "Violencia generalizada."
        static let text4 = "Violaciones masivas a los derechos humanos "
        static let text5 = "Otras circunstancias que perturben gravemente el orden público"
    }
    
    struct PAGE_32 {
        static let text_1Y = "¡Las respuestas que has dado a las cinco preguntas de este módulo, dan cuenta de que eres una persona que necesita Protección Internacional!"
        static let text_2Y = "Te invitamos a consultar la sección de Planea tu viaje - Refugio, para obtener más información sobre lo que debes hacer. También puedes ponerte en contacto con nosotros; consulta esta información en el menú ubicado en la parte izquierda superior de tu pantalla."
        
        static let text_1N = "¡Las respuestas que has dado a las cinco preguntas de este módulo, dan cuenta de que eres una persona que no necesita Protección Internacional!"
        static let text_2N = "En todo caso te invitamos a que consultes en nuestro directorio, las organizaciones que pueden orientarte a nivel legal para atender tu caso. Igualmente navega por nuestro menú para que conozcas a qué otros mecanismos de atención migratoria puedes acceder."
        
        static let text3 = "Has finalizado con éxito este tercer y último módulo y con seguridad te llevas grandes aprendizajes."
    }
    
    struct PAGE_33 {
        static let text1 = "Tienes tu tercera insignia: ya eres un Consejero/a Experto/a"
        static let text2 = "¿Quieres revisar nuevamente los contenidos de este módulo?"
    }
    /** END MODULE 3 **/
}
