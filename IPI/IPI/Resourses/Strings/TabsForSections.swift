//
//  TabsForSections.swift
//  IPI
//
//  Created by Felipe Zamudio on 6/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

/// Nombre de las pesañas organizadas por secciones
struct TabsName {
    
    struct AboutNRCTabs {
        static let tab_01 = "QUIÉNES SOMOS"
        static let tab_02 = "QUÉ HACEMOS"
        static let tab_03 = "DÓNDE TRABAJAMOS"
    }
    
    struct GeneralDataTabs {
        static let tab_01 = "DATOS \nGENERALES"
        static let tab_02 = "TEMPERATURA"
        static let tab_03 = "TRAYECTOS EN \nTRANSPORTE PÚBLICO"
    }
}

// MARK: - Funciones para retornar las pestañas de una vista
/**
 Retorna una lista, con los nombres de las pestañas de una vista en particular.
 
 - Parameter forVieID: Id de la vista padre que contendra las pestañas
 - Returns: Cadena con los titulos de las respectivas pestañas
 */
func getTabs(forViewID id: ViewControllerID) -> [String] {
    
    switch id {
        
    case .aboutUs:
        return [TabsName.AboutNRCTabs.tab_01, TabsName.AboutNRCTabs.tab_02, TabsName.AboutNRCTabs.tab_03]
        
    case .countryData:
        return [TabsName.GeneralDataTabs.tab_01, TabsName.GeneralDataTabs.tab_02, TabsName.GeneralDataTabs.tab_03]
        
    default:
        return [nullString]
    }
}

