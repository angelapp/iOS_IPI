//
//  PhonebookViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class PhonebookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var tbl_phonebook: UITableView!

    //Properties
    var coutryName: String = nullString

    // Phonebook list
    var city: City!
    var phoneListByType: Array<OrganizationType> = []

    // Expandable
    var expandedSections : NSMutableSet = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false

        //Load data
        if phoneListByType.count == 0 {
            phoneListByType = orderByOrganizationType(phoneBook: city?.cityPhonebook ?? [])
        }

        tbl_phonebook.delegate = self
        tbl_phonebook.dataSource = self
        
        tbl_phonebook.reloadData()
    }

    override func viewDidDisappear(_ animated: Bool) {
        city = nil
        phoneListByType = []
        tbl_phonebook.reloadData()
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
        
        tbl_phonebook.reloadData()
        
        if indexPath != nil {
            tbl_phonebook.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }

    // MARK: - Gestures
     @objc func openCall(sender : IPITapGesture) {

        let number = sender.phoneNumber.components(separatedBy: .whitespaces).joined()

        if let url = URL(string: String(format: Formats.callFormat, number)), UIApplication.shared.canOpenURL(url) {

            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        else {
            showErrorMessage(withMessage: ErrorMessages.disabledAction)
        }
    }

    // MARK: - Table view Delegate and Datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return phoneListByType.count
    }

    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandedSections.contains(section) ? phoneListByType[section].registries.count : 0
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

        cell?.headerTitle = phoneListByType[section].name
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

    // fill Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.footer.rawValue) as! CourseFooterTableViewCell
        return cell
    }

    // fill Body
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue) as! PhonebookTableViewCell

        cell.phoneItem = phoneListByType[indexPath.section].registries[indexPath.row]
        cell.fillCell()

        // Crea tap gesture si existe número
        if let phone = cell.lbl_phone.text, phone != nullString {

            //create Tap gesture
            let callGesture = IPITapGesture(target: self, action: #selector(self.openCall))
            callGesture.phoneNumber = phone

                // Add geture
            cell.lbl_phone.isUserInteractionEnabled = true
            cell.lbl_phone.addGestureRecognizer(callGesture)
        }

        return cell
    }
}
