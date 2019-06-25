//
//  IPISuggestions.swift
//  IPI
//
//  Created by Felipe Zamudio on 23/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

enum RecomendationsTittles: String, CaseIterable {
    case item_00 = "Violencia basada en género"
    case item_01 = "Trata/Tráfico de personas"
    case item_02 = "Explotación y abuso sexual de niños y niñas"
    case item_03 = "Albergue"
    case item_04 = "Agua, saneamiento e higiene"
    case item_05 = "Salud"
    case item_06 = "Reclutamiento forzado para actividades ilegales"
	
	static var asArray: [RecomendationsTittles] {return self.allCases}
    
    func asInt() -> Int {
        return RecomendationsTittles.asArray.firstIndex(of: self)!
    }
}

enum RecomendationsContent_00: String, CaseIterable {
	case item_01 = "Ten en cuenta que la violencia basada en género es cualquier acción dirigida a una mujer que afecte su vida, la coacción o privación de su libertad, la amenace, le cause muerte, daño o sufrimiento físico, sexual, psicológico, emocional, económico o patrimonial, por el simple hecho de ser mujer. Toda forma de violencia basada en género es considerada como un delito."
	case item_02 = "Si viajas sola, mantén contacto con tu familia o una persona de confianza en todo momento. Procura no viajar con desconocidos y aléjate de personas que te aborden en la calle."
	case item_03 = "Crea redes de apoyo con otras personas migrantes con quienes puedan establecer indicaciones para cuidarse mutuamente. Infórmense previamente, si tienen que dirigirse a un ambiente hostil, carreteras o zonas peligrosas."
	case item_04 = "No dejes a niños y niñas al cuidado de extraños. Cuéntales sobre los riesgos que existen en relación con la violencia de género, trata y tráfico de personas."
	case item_05 = "Si eres víctima de violencia sexual la atención médica debe ser prioritaria e inmediata, sin importar el tiempo entre el hecho violento y la consulta. Solicita que te practiquen exámenes para detectar enfermedades de transmisión sexual (ETS), incluyendo el VIH SIDA. También puedes pedir que te suministren anticoncepción de emergencia. Esta atención será gratuita en algunos países."
	case item_06 = "Si decides poner la denuncia ante las autoridades responsables por cualquier tipo de violencia, intenta conservar las pruebas. Para esto es clave por ejemplo: no bañarse, no cambiarse de ropa, no limpiar las heridas. Protege el lugar de los hechos así como cualquier elemento con el que se haya producido el acto violento. Dependiendo el país en donde te encuentres, comunícate con las líneas telefónicas de orientación a mujeres, gratuitas, que funcionan las 24 horas."
	case item_07 = "¡Por último y no menos importante! No importa que seas extranjera, tienes derecho a ser respetada y a vivir libre de agresiones."
	case item_08 = "Si vas a caminar largos recorridos y personas desconocidas te ofrecen llevarte gratuitamente en algún medio de transporte, ten precaución con quienes van en su interior. No permitas de ningún modo, que se lleven a los niños y/o niñas sin tu compañía."

	static var asArray: [RecomendationsContent_00] {return self.allCases}
    
    func asInt() -> Int {
        return RecomendationsContent_00.asArray.firstIndex(of: self)!
    }
}

enum RecomendationsContent_01: String, CaseIterable {
	case item_01 = "El comercio ilegal de seres humanos con propósitos de esclavitud laboral, mental, reproductiva, explotación sexual, trabajos forzados, extracción de órganos, o cualquier forma de esclavitud contra la voluntad y el bienestar del ser humano, se conoce como  trata, comercio o tráfico de personas."
	case item_02 = "Una forma de prevenir este delito es informándote previamente sobre los requisitos legales para ingresar, residir y/o trabajar en el país al que te diriges y en la medida de lo posible, realizando todos los trámites siempre por las vías oficiales dispuestas para tal fin; no a través de intermediarios."
	case item_03 = "Protege tus documentos personales para evitar deterioros: saca una copia o escanea tu pasaporte y/o documentos de identidad."
	case item_04 = "Ten cuidado con lo que te ofrecen por redes sociales; hay ofertas de trabajos muy atractivos que generalmente no son ciertas."
	case item_05 = "Evita aceptar solicitudes de personas desconocidas en tus redes sociales. Sé cuidadoso/a con la información que publicas."
	case item_06 = "Lleva copia de los documentos de identificación de los niños y niñas con quienes viajes (partidas de nacimiento o registros civiles)"
	case item_07 = "Aléjate de personas que te aborden en la calle y bajo ninguna circunstancia, entregues tus documentos de identificación o de viaje a desconocidos"
	case item_08 = "No dejes a niños y niñas al cuidado de extraños. Cuéntales sobre los riesgos que existen en relación con la violencia de género, trata y tráfico de personas."
	case item_09 = "Si vas a caminar largos recorridos y personas desconocidas te ofrecen llevarte gratuitamente en algún medio de transporte, ten precaución con quienes van en su interior. No permitas de ningún modo, que se lleven a los niños y/o niñas sin tu compañía."

	static var asArray: [RecomendationsContent_01] {return self.allCases}
    
    func asInt() -> Int {
        return RecomendationsContent_01.asArray.firstIndex(of: self)!
    }
}

enum RecomendationsContent_02: String, CaseIterable {
	case item_01 = "La explotación sexual es toda intrusión física de carácter sexual, por la fuerza. Es decir cualquier tipo de abuso cometido o, intento de abuso, en una situación de vulnerabilidad, de relación de fuerza desigual o de confianza."
	case item_02 = "Existen algunos signos de alerta en niños, niñas y jóvenes que indican síntomas de abuso. Pueden variar, por tanto es necesario observar e investigar con más detenimiento."
	case item_03 = "Estos signos pueden ser: un cambio de conducta abrupto o inesperado, conocimiento inusual sobre sexo para su edad, falta de confianza o miedo, lentitud en el desarrollo físico, intelectual o emocional, alteración del sueño inseguridad, baja autoestima, comportamiento auto - destructivo, depresión e intento de suicidio."
	case item_04 = "No dejes a los niños y niñas al cuidado de extraños. Cuéntales sobre los riesgos que existen en relación con la violencia de género, trata y tráfico de personas."
	case item_05 = "Si vas a caminar largos recorridos y personas desconocidas te ofrecen llevarte gratuitamente en algún medio de transporte, ten precaución con quienes van en su interior. No permitas de ningún modo, que se lleven a los niños y/o niñas sin tu compañía."

	static var asArray: [RecomendationsContent_02] {return self.allCases}
    
    func asInt() -> Int {
        return RecomendationsContent_02.asArray.firstIndex(of: self)!
    }
}

enum RecomendationsContent_03: String, CaseIterable {
	case item_01 = "Si accedes a un cobijo o albergue, ten en cuenta que sea un lugar que garantice tu dignidad, privacidad, salud, protección física y social. Revisa el tipo de contrato y legalidad del lugar donde decides permanecer."
	case item_02 = "Evalúa los posibles riesgos (naturales o humanos) a los que te puedes ver expuesto según el lugar donde decidas dormir."
	case item_03 = "Evita lugares en donde se hospede más de 1 persona por cada 3,5 metros cuadrados, o más de una familia por espacio habitable. Esto para evitar riesgos de abusos, violaciones u otros tipos de violencia."
	case item_04 = "Busca opciones de hospedaje que cuenten con los servicios básicos: agua, saneamiento, electricidad y gas. Asegúrate también, de tener un control del acceso de las puertas de tu habitación o cuarto desde el interior."
	case item_05 = "No permitas que dividan a tu grupo familiar si te ofrecen una opción de alojamiento temporal. Es importante que los niños, niñas y adolescentes de tu grupo familiar no permanezcan solos, tengan privacidad y estén protegidos contra cualquier riesgo dentro del albergue."
	case item_06 = "Revisa bien el estado de la construcción en donde te alojas grietas o fisuras importantes pueden generar la caida de una teja, pared o material defectuoso. De igual forma, evita la exposición a elementos cortantes, toma corrientes, cables en mal estado, caídas o falta de protección en ventanas, puertas, escaleras o balcones que pueden causar caídas o accidentes"
	case item_07 = "Procura ubicar lugares que se adecúen a tu contexto sociocultural y étnico."
	case item_08 = "Demanda tu participación activa en la toma de decisiones sobre la posible respuesta humanitaria en temas de albergue."

	static var asArray: [RecomendationsContent_03] {return self.allCases}
    
    func asInt() -> Int {
        return RecomendationsContent_03.asArray.firstIndex(of: self)!
    }
}

enum RecomendationsContent_04: String, CaseIterable {
	case item_01 = "El acceso a agua y saneamiento además de ser un derecho fundamental, protege tu salud y la de la comunidad en donde te encuentres."
	case item_02 = "Evalúa los posibles riesgos (naturales o humanos) a los que te puedes ver expuesto según el lugar donde vayas al baño o a conseguir agua. Piensa en medidas de autoprotección para sentirte más seguro/a: visitas en grupo, utilización de luces, compra de seguros o candados para puertas, entre otros."
	case item_03 = "Busca lugares con iluminación natural durante el día e iluminación artificial durante la noche que te permita aumentar tu sensación de seguridad."
	case item_04 = "Si eres mujer, genera medidas de autoprotección y ciudado personal cuando vayas a eliminar las toallas higiénicas o desechos generados durante tu higiene."
	case item_05 = "Solicita opciones de higiene y saneamiento que se adecúen a tu contexto sociocultural y étnico. En la medida de lo posible, elige lugares con baños y duchas diferenciados por sexo. Intenta garantizar condiciones de privacidad en los espacios de aseo personal, baños o duchas, sobre todo para los niños, niñas y adolescentes."
	case item_06 = "Realiza tu lavado de manos después de ir al baño, y antes de consumir cualquier alimento. Si no tienes a disposición agua y jabón, busca opciones como lociones a base de alcohol o desinfectantes."
	case item_07 = "No tires tus desechos fuera de los puntos indicados, puedes estar contaminando el agua que luego vas a necesitar."

	static var asArray: [RecomendationsContent_04] {return self.allCases}
    
    func asInt() -> Int {
        return RecomendationsContent_04.asArray.firstIndex(of: self)!
    }
}

enum RecomendationsContent_05: String, CaseIterable {
	case item_01 = "Lleva una copia del carnet de salud, de vacunación propio y el de los niños, niñas y adolescentes que hagan parte de tu núcleo familiar."
	case item_02 = "Si eres una persona en situación de discapacidad, presentas una condición física especial, alguna enfermedad o te encuentras en estado de embarazo, trata de no caminar largas distancias por períodos extensos. Descansa frecuentemente. Recuerda que tu vida es muy valiosa y por ningún motivo debes ponerla en peligro."
	case item_03 = "Hidrátate y procura comer regularmente. Ten en cuenta que en ciertas zonas, dependiendo de la condiciones climatológicas o de ambiente, tendrás que aumentar el consumo de bebidas y alimentos para ti y los niños y niñas con quienes viajas."
	case item_04 = "No te expongas innecesariamente a climas extremos, si no cuentas con la ropa adecuada para protegerte, sobre todo de bajas temperaturas en donde puedes presentar hipotermia. Cuídate del sol y las altas temperaturas, en donde puedas presentar deshidratación."
	case item_05 = "En caso de ser víctima de violencia sexual o violencia de género, consulta las recomendaciones indicadas en el apartado correspondiente en esta sección."

	static var asArray: [RecomendationsContent_05] {return self.allCases}
    
    func asInt() -> Int {
        return RecomendationsContent_05.asArray.firstIndex(of: self)!
    }
}

enum RecomendationsContent_06: String, CaseIterable {
	case item_01 = "Viajar solo, aumenta los riesgos de seguridad, por tanto es fundamental que mantengas contacto permanente con tus familiares o allegados."
	case item_02 = "Evita las zonas poco habitadas, especialmente en zona rural y trata de no alejarte de la carretera principal, en caso de que estés caminando."
	case item_03 = "Infórmate de manera previa sobre las condiciones de seguridad en las zonas por las que vas a transitar. Mantente alerta si has escuchado comentarios sobre reclutamiento forzado de niños, niñas y adolescentes."
	case item_04 = "No pierdas de vista a los niños y niñas con quienes viajes, incluso en zonas de esparcimiento como parques, en actividades recreativas organizadas por terceros, en albergues u hospedajes, en establecimientos públicos, entre otros."
	case item_05 = "No te confíes, sin investigar previamente, sobre trabajos que se vean fáciles o atractivos. Puede ser el inicio de una vinculación forzada en un grupo ilegal."
	case item_06 = "Si vas a caminar largos recorridos y personas desconocidas te ofrecen llevarte gratuitamente en algún medio de transporte, ten precaución con quienes van en su interior. No permitas de ningún modo, que se lleven a los niños y/o niñas sin tu compañía."

	static var asArray: [RecomendationsContent_06] {return self.allCases}
    
    func asInt() -> Int {
        return RecomendationsContent_06.asArray.firstIndex(of: self)!
    }
}
