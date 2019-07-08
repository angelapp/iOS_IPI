//
//  DocumentsLegalViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 24/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class DocumentsLegalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    // MARK: - Outlets
    @IBOutlet weak var tbl_documents: UITableView!

    // MARK: - Properties
    var documentType: Int!
    var documents: Array<LibraryDocument> = []
    var documentsDelegate: DocumentsViewControllerDelegate?

    var expandedSections : NSMutableSet = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        documents = AplicationRuntime.sharedManager.getDocuments(fromType: documentType)

        tbl_documents.delegate = self
        tbl_documents.dataSource = self
    }

    // MARK: - Expandable tableview functions
    /// Determina la sección de la tabla que fue seleccionada para mostrar el contenido
    @objc func tapSection(sender: UITapGestureRecognizer) {
        
        let sectionTapped = sender.view!
        let section = sectionTapped.tag
        
        let shouldExpand = !expandedSections.contains(section)

        if (shouldExpand) {
            expandedSections.removeAllObjects()
            expandedSections.add(section)
        } else {
            expandedSections.removeAllObjects()
        }

        tbl_documents.reloadData()
    }

    // MARK: - TableView delegate and datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return documents.count
    }

    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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

        cell?.headerTitle = documents[section].name
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

    // Dibuja el pie de página
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.footer.rawValue) as! CourseFooterTableViewCell
        return cell
    }

    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }

    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue) as! DocumentsBodyTableViewCell

        //Look the URL file
        var fileURL = nullString
        if documents[indexPath.section].file != nil {
            fileURL = documents[indexPath.section].file
        }
        else if documents[indexPath.section].url != nil {
            fileURL = documents[indexPath.section].url
        }

        cell.lbl_text.text = documents[indexPath.section].name
        cell.file = fileURL
        cell.documentsDelegate = self.documentsDelegate
        cell.config_buttons()

        return cell
    }
}
