//
//  TabButtonsCollectionViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 6/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//
//
//  Clase para llenar y dar aciones a las pestañas.
//
//  Estas pesatañas se crean como celdas dentro
//  de un collectionView

import UIKit

class TabButtonsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var tab_button: UIButton!
    @IBOutlet weak var underline: UIView!
    
    // MARK: - Properties
    // Protocolos de las clases que pueden hacer uso de la celda
    // Se usan para actualizar la vista padre
    
    var aboutNRCTabDelegate: AboutNRCTabProtocol? // Protocolo para las pestañas de "Sobre NRC"
    var documentsTabDelegate: DocumentsViewControllerDelegate? // Protocolo para las pestañas de "Documentos"
    var countryDataTabDelegate: CountryDataViewControllerDelegate? // Protocolo para las pestañas de "Datos del pais"
//    var progressTabDelegate: ProgressTabProtocol? // Protocolo para las pestañas de "Progreso Cursos"
//    var vbgRoutesTabDelegate: VBGRouteTabProtocol? // Protocolo para las pestañas de "Rutas de protecion Violencia Basada en Genero"
    var titleButton: String = nullString
    
    // MARK: - Functions
    /// Da titulo al botón de la celda, para los estado:
    /// - normal
    /// - resaltado
    /// - seleccionado
    func setButtonTitle() {
        tab_button.setTitle(titleButton, for: .normal)
        tab_button.setTitle(titleButton, for: .highlighted)
        tab_button.setTitle(titleButton, for: .selected)
    }
    
    // MARK: - Actions
    /** Actualizar la vista en el controlador padre atravez del uso del protocolo
     que este activo, es decir, que no sea nulo */
    @IBAction func actionButton(_ sender: UIButton){
        aboutNRCTabDelegate?.changeTabSelected(toPosition: tab_button.tag)
        documentsTabDelegate?.changeTabSelected(toPosition: tab_button.tag)
        countryDataTabDelegate?.changeTabSelected(toPosition: tab_button.tag)
//        progressTabDelegate?.changeTabSelected(toPosition: tab_button.tag)
//        vbgRoutesTabDelegate?.changeTabSelected(toPosition: tab_button.tag)
    }
}
