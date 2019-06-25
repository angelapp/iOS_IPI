//
//  VisasViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class VisasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	// MARK: - Outlets 
	@IBOutlet weak var lbl_msn: UILabel!
	@IBOutlet weak var tbl_visas: UITableView!

	// MARK: - Properties
    var mainDelegate: MainProtocol?
	var visas: Array<VisaModel> = []
    
    var originCountryID: Int!
    var targetCountryID: Int!
	
    var expandedSections : NSMutableSet = []
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load Data
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        visas = (AplicationRuntime.sharedManager.getPlanTrip()?.visas)!
        originCountryID = AplicationRuntime.sharedManager.getPlanTrip()?.natCountryID
        targetCountryID = AplicationRuntime.sharedManager.getPlanTrip()?.desCountryID
        
		var country = nullString
        if targetCountryID != nil {
            country = AplicationRuntime.sharedManager.getCountry(fromID: targetCountryID, getName: true)
        }
        
        lbl_msn.text = String(format: Formats.visasFormat, country)
        
        tbl_visas.delegate = self
        tbl_visas.dataSource = self
    }
	
	// MARK: - Expandable tableview functions
    //Determina la sección de la tabla que fue seleccionada para mostrar el contenido
    @objc func sectionTapped(_ sender: UIButton) {
        
        let section = sender.tag
        let shouldExpand = !expandedSections.contains(section)
        
        if (shouldExpand) {
            expandedSections.removeAllObjects()
            expandedSections.add(section)
        } else {
            expandedSections.removeAllObjects()
        }
        
        tbl_visas.reloadData()
    }
    
	// MARK: - Table view Delegate and Datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return visas.count
    }
	
	// Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandedSections.contains(section) ? 1 : 0
    }
	
	// MARK: Header properties
    // Propiedad para ajustar el tamaño del encabezado al contenido
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado del encabezado
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 62
    }
	
	// Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Load and fill de cell
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.header.rawValue) as? CourseHeaderTableViewCell
        
        cell?.headerTitle = visas[section].name
        cell?.fill_header(forTable: TABLE_SAMPLES)
        cell?.btn_openClose.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
        cell?.btn_openClose.tag = section
        cell?.btn_openClose.isSelected = expandedSections.contains(section)
        
        return cell
    }
    
    // MARK: Footer properties
    // Se agrega la propiedad para ajustar el tamaño del pie de página al contenido
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado del pie de página
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 58
    }
    
    // Draw Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.footer.rawValue) as! CourseFooterTableViewCell
        return cell
    }
	
	// Draw Body
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue) as! CourseBodyTableViewCell
        
        let htmlCSSString = Formats.cssStyles + visas[indexPath.section].description
		cell.lbl_text.attributedText = htmlCSSString.htmlToAttributedString!
		
		return cell
    }
}
