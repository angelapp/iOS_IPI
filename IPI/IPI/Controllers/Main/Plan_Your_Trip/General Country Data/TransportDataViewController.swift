//
//  TransportDataViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 16/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class TransportDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var tbl_transportData: UITableView!

    // MARK: - Properties
    var cityOriginList: Array<TransportInfoList> = []

    // Expandable
    var expandedSections : NSMutableSet = []

    weak var mainDelegate = AplicationRuntime.sharedManager.mainDelegate

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        cityOriginList = AplicationRuntime.sharedManager.getTransportByCity()

        tbl_transportData.delegate = self
        tbl_transportData.dataSource = self
    }

    // Clean Al properties when the controller its removed
    override func viewDidDisappear(_ animated: Bool) {
        cityOriginList = []
    }

    // MARK: - Expandable tableview functions
    //Determina la sección de la tabla que fue seleccionada para mostrar el contenido
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
        
        tbl_transportData.reloadData()
        
        if indexPath != nil {
            tbl_transportData.scrollToRow(at: indexPath, at: .top, animated: true)
        }

    }

    // MARK: - Table view Delegate and Datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return cityOriginList.count
    }

    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandedSections.contains(section) ? cityOriginList[section].targetList.count : 0
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

        cell?.headerTitle =  String(format: Formats.transportHeaderFormat, cityOriginList[section].name)
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
        return 10
    }

    // fill Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.footer.rawValue) as! CourseFooterTableViewCell
        return cell
    }

    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }

    // fill body
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Fill cell for Remember section
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue) as! WeatherTransporBodyTableViewCell

        let transportInfo = cityOriginList[indexPath.section].targetList[indexPath.row]

        cell.lbl_city.text = AplicationRuntime.sharedManager.getCityName(forID: transportInfo.target_city)
        cell.lbl_text_01.text = transportInfo.time_between_cities

        let color = indexPath.row%2 == 0 ? UIColor.white : Colors().getColor(from: ConseColors.background_acordeon.rawValue)
        cell.view.backgroundColor = color

        return cell
    }
}
