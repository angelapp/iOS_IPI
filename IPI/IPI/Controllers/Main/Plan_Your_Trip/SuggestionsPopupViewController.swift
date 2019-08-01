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

    var headers: Array<RecomendationsTittles> = []
    var bodyContent_00: Array<RecomendationsContent_00> = []
    var bodyContent_01: Array<RecomendationsContent_01> = []
    var bodyContent_02: Array<RecomendationsContent_02> = []
    var bodyContent_03: Array<RecomendationsContent_03> = []
    var bodyContent_04: Array<RecomendationsContent_04> = []
    var bodyContent_05: Array<RecomendationsContent_05> = []
    var bodyContent_06: Array<RecomendationsContent_06> = []

    var expandedSections : NSMutableSet = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load Data
        headers = RecomendationsTittles.asArray
        bodyContent_00 = RecomendationsContent_00.asArray
        bodyContent_01 = RecomendationsContent_01.asArray
        bodyContent_02 = RecomendationsContent_02.asArray
        bodyContent_03 = RecomendationsContent_03.asArray
        bodyContent_04 = RecomendationsContent_04.asArray
        bodyContent_05 = RecomendationsContent_05.asArray
        bodyContent_06 = RecomendationsContent_06.asArray

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
            expandedSections.removeAllObjects()
            expandedSections.add(section)
            indexPath = IndexPath(row: 0, section: section)
        } else {
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
        return headers.count
    }

    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
            case RecomendationsTittles.item_00.asInt():
                return expandedSections.contains(section) ? bodyContent_00.count : 0
            case RecomendationsTittles.item_01.asInt():
                return expandedSections.contains(section) ? bodyContent_01.count : 0
            case RecomendationsTittles.item_02.asInt():
                return expandedSections.contains(section) ? bodyContent_02.count : 0
            case RecomendationsTittles.item_03.asInt():
                return expandedSections.contains(section) ? bodyContent_03.count : 0
            case RecomendationsTittles.item_04.asInt():
                return expandedSections.contains(section) ? bodyContent_04.count : 0
            case RecomendationsTittles.item_05.asInt():
                return expandedSections.contains(section) ? bodyContent_05.count : 0
            default:
                return expandedSections.contains(section) ? bodyContent_06.count : 0
        }
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

        cell?.headerTitle = headers[section].rawValue
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

        if indexPath.section == RecomendationsTittles.item_00.asInt(){
            cell.lbl_text.text = bodyContent_00[indexPath.row].rawValue
        }
        else if indexPath.section == RecomendationsTittles.item_01.asInt(){
            cell.lbl_text.text = bodyContent_01[indexPath.row].rawValue
        }
        else if indexPath.section == RecomendationsTittles.item_02.asInt(){
            cell.lbl_text.text = bodyContent_02[indexPath.row].rawValue
        }
        else if indexPath.section == RecomendationsTittles.item_03.asInt(){
            cell.lbl_text.text = bodyContent_03[indexPath.row].rawValue
        }
        else if indexPath.section == RecomendationsTittles.item_04.asInt(){
            cell.lbl_text.text = bodyContent_04[indexPath.row].rawValue
        }
        else if indexPath.section == RecomendationsTittles.item_05.asInt(){
            cell.lbl_text.text = bodyContent_05[indexPath.row].rawValue
        }
        else {
            cell.lbl_text.text = bodyContent_06[indexPath.row].rawValue
        }

        cell.img_item.image = UIImage(named: IPI_IMAGES.success_orange)

        return cell
    }

    //MARK: - actionButtons
    @IBAction func actionButtons (_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
