//
//  GeneralDataViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 16/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class GeneralDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var tbl_countryData: UITableView!

    // MARK: - Properties
    var countrDataList: Array<GeneralCountryData>!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        countrDataList = AplicationRuntime.sharedManager.getGeneralDataList()

        tbl_countryData.delegate = self
        tbl_countryData.dataSource = self
    }

    // MARK: - TableView delegate and datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countrDataList.count
    }

    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }

    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue, for: indexPath) as! CourseBodyTableViewCell
        let htmlCSSString = Formats.cssStyles + countrDataList[IndexPath.row].description

        cell.img_item.image = UIImage(named: countrDataList[IndexPath.row].icon)
        cell.lbl_title.text = countrDataList[IndexPath.row].title
        cell.lbl_text.attributedText = htmlCSSString.htmlToAttributedString!

        return cell
    }
}
