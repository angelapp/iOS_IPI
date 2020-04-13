//
//  SuggestionsPopupViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 24/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class SuggestionsPopupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: -  Outlets
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_text: UILabel!
    @IBOutlet weak var tbl_suggestions: UITableView!

    // MARK: - Properties

    
    var recommendations: Array<ProtectionRecommendation>!
    var expandedSections : NSMutableSet = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load Data
        recommendations = AplicationRuntime.sharedManager.getPlanTrip()?.protection_commendations
        
        
        // Fill view
        lbl_title.text = Labels.suggestions_title
        lbl_text.text = Labels.suggestions_text

        setButtonImages(button: btn_back, normal: IPI_IMAGES.btn_back_green, hover: nullString)
    }

    // MARK: - Expandable tableview functions
    /// Determina la sección de la tabla que fue seleccionada para mostrar el contenido
    @objc func tapSection(sender: UITapGestureRecognizer) {

        let sectionTapped = sender.view!
        let section = sectionTapped.tag
        let shouldExpand = !expandedSections.contains(section)
        var indexPath: IndexPath!
        
        if (shouldExpand) {
            print("Should expand")
            expandedSections.removeAllObjects()
            expandedSections.add(section)
            indexPath = IndexPath(row: 0, section: section)
        } else {
            print("No Should expand")
            expandedSections.removeAllObjects()
            indexPath = IndexPath(row: NSNotFound, section: section)
        }
        
        tbl_suggestions.reloadData()
        
        if indexPath != nil {
            tbl_suggestions.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }

    // MARK: - Table view Delegate and Datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return recommendations.count
    }

    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return expandedSections.contains(section) ? String(recommendations[section].content).split { $0.isNewline }.count : 0
        //return String(recommendations[section].content).split { $0.isNewline }.count
        
 
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

        cell?.headerTitle = recommendations[section].title
        
        cell?.fill_header(forTable: TABLE_SAMPLES)

        cell?.btn_openClose.tag = section
        cell?.tag = section

        // Add Gesture for expand list
        let tapButton = UITapGestureRecognizer(target: self, action: #selector(self.tapSection))
        cell?.btn_openClose.addGestureRecognizer(tapButton)

        let tapHeader = UITapGestureRecognizer(target: self, action: #selector(self.tapSection))
        cell?.addGestureRecognizer(tapHeader)

        // Update Button state
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
        
        cell.lbl_text.text = String(String(recommendations[indexPath.section].content).split { $0.isNewline }[indexPath.row])


        cell.img_item.image = UIImage(named: IPI_IMAGES.success_orange)
 

        return cell
    }

    //MARK: - actionButtons
    @IBAction func actionButtons (_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
