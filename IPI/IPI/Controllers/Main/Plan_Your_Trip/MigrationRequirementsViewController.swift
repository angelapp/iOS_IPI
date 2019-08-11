//
//  MigrationRequirementsViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 16/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class MigrationRequirementsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var lbl_msn: UILabel!
    @IBOutlet weak var tbl_requirements: UITableView!
    
    // properties
    var items: Array<String> = []
    var migrationRequirements: Array<MigrationsRequirementsModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        migrationRequirements = AplicationRuntime.sharedManager.getPlanTrip()?.migrations_requirements
        
        tbl_requirements.delegate = self
        tbl_requirements.dataSource = self
        
        drawScreen()
    }
    
    private func drawScreen() {
        
        // Make the message
        let countryName = AplicationRuntime.sharedManager.getCountry(fromID: migrationRequirements[0].target_country, getName: true)
        lbl_msn.text = String(format: Formats.migrationRequirementFormat, countryName)
        
        // Fill items requirements
        for req in migrationRequirements {
            items.append(req.description!)
        }
        
        tbl_requirements.reloadData()
    }
    
    // MARK: - TableView delegate and datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return migrationRequirements.count
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.migrationRequirementsBody.rawValue, for: indexPath) as! CourseBodyTableViewCell
        
        let htmtText = items[indexPath.row].replacingOccurrences(of: "\"", with: "")
        printDebugMessage(tag: htmtText)
        let htmlCSSString = Formats.cssStyles + htmtText//items[indexPath.row]
        cell.lbl_text.attributedText = htmlCSSString.htmlToAttributedString!
        
        return cell
    }
}
