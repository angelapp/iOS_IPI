//
//  NationalizationRequirementsViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class NationalizationRequirementsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var tbl_requirements: UITableView!
    
    // MARK: - Properties
    var targetCountryID: Int!
    var nationality = nullString
    
    let NAT_DES_TAG = 0
    let DES_TAG = 1
    
    var nationalizationRequirements: NationalizationRequirements!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load data
        nationalizationRequirements = AplicationRuntime.sharedManager.getPlanTrip()?.nationalization_requirements
        targetCountryID = AplicationRuntime.sharedManager.getPlanTrip()?.desCountryID
        
        if targetCountryID != nil {
            nationality = AplicationRuntime.sharedManager.getCountry(fromID: targetCountryID, getName: false, getNationality: true)
        }
    }
    

    // MARK: - Table view Delegate and Datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue) as! CourseBodyTableViewCell
        
        var text = nullString
        
        switch indexPath.row {
        case NAT_DES_TAG:
            text = nationalizationRequirements.native_condition_description!
            cell.lbl_title.text = String(format: Formats.nationalizationFormat, nationality)
            cell.backgroundColor  = Colors().getColor(from: ConseColors.yellow_background.rawValue)
            break
            
        case DES_TAG:
            text = nationalizationRequirements.description!
            cell.lbl_title.text = nullString
            cell.backgroundColor = UIColor.white.withAlphaComponent(0)
            break
        
        default:
            text = nationalizationRequirements.reminder!
            cell.lbl_title.text = Labels.remind
            cell.backgroundColor = UIColor.groupTableViewBackground
            break
        }
        
        switch indexPath.row {
        case NAT_DES_TAG, DES_TAG:
            let htmlCSSString = Formats.cssStyles + text
            cell.lbl_title.font = cell.lbl_title.font.bold
            cell.lbl_text.attributedText = htmlCSSString.htmlToAttributedString!
            break
        
        default:
            let htmlCSSString = Formats.cssItalicStyles + text
            cell.lbl_title.font = cell.lbl_title.font.boldItalic
            cell.lbl_text.attributedText = htmlCSSString.htmlToAttributedString!
            break
        }
        
        return cell
    }
}
