//
//  WeatherDataViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 16/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class WeatherDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Outlets
    @IBOutlet weak var tbl_weather: UITableView!
    
    //Properties
    var tempByCityList: Array<TempByCityModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tempByCityList = AplicationRuntime.sharedManager.getPlanTrip()?.temp_by_city
        
        tbl_weather.delegate = self
        tbl_weather.dataSource = self
    }
    
    // MARK: - TableView delegate and datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempByCityList.count
    }
    
    // MARK: Header properties
    // Propiedad para ajustar el tamaño del encabezado al contenido
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado del encabezado
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 42
    }
    
    // Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Load and fill de cell
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.header.rawValue) as? WeatherTransporBodyTableViewCell
        return cell
    }

    // MARK: Footer properties
    // Se agrega la propiedad para ajustar el tamaño del pie de página al contenido
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado del pie de página
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 28
    }
    
    // fill Footer
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
        return 42
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue, for: indexPath) as! WeatherTransporBodyTableViewCell
        
        let tempByCity = tempByCityList[indexPath.row]
        
        cell.lbl_city.text = AplicationRuntime.sharedManager.getCityName(forID: tempByCity.city)
        cell.lbl_text_01.text = String(format: Formats.weatherFormat, String(tempByCity.max_temp))
        cell.lbl_text_02.text = String(format: Formats.weatherFormat, String(tempByCity.min_temp))
        
        let color = indexPath.row%2 == 0 ? UIColor.groupTableViewBackground : UIColor.white
        cell.view.backgroundColor = color
        
        return cell
    }
}
