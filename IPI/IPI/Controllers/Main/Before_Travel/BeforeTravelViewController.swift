//
//  BeforeTravelViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import AVFoundation

class BeforeTravelViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK: - Outlet
    @IBOutlet weak var tbl_before_travel: UITableView!
    
    // MARK: - Properties
    var ncrAudio: AVAudioPlayer?
    var mainDelegate: MainProtocol?
    var isPlaying = nullString
    var before_list : [[String : String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        before_list = getBeforeTravel()
    }
    
    // MARK: - Private Functions
    private func playAudio(audio name: String) {
        
        if isPlaying != nullString {
            stopAudio(audio: name)
        }
        
        if let path = Bundle.main.path(forResource: name, ofType:"mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                ncrAudio = try AVAudioPlayer(contentsOf: url)
                ncrAudio?.play()
                ncrAudio?.delegate = self
                isPlaying = name
            } catch {
                mainDelegate?.showMessageInMain(withMessage: ErrorMessages.audioDontLoad)
            }
        }
        else {
            mainDelegate?.showMessageInMain(withMessage: ErrorMessages.audioNotFound)
        }
    }
    
    private func stopAudio(audio name: String) {
        if let path = Bundle.main.path(forResource: name, ofType:"mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                ncrAudio = try AVAudioPlayer(contentsOf: url)
                ncrAudio?.stop()
                ncrAudio?.delegate = self
                isPlaying = nullString
            } catch {
                mainDelegate?.showMessageInMain(withMessage: ErrorMessages.audioDontLoad)
            }
        }
        else {
            mainDelegate?.showMessageInMain(withMessage: ErrorMessages.audioNotFound)
        }
    }
    
    // MARK: - AVAudioPlayer Delegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        tbl_before_travel.reloadData()
    }
    
    // MARK: - TableView delegate and datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return before_list.count
    }
    
    // Se agrega la propiedad para ajustar el tamaño del pie de página al contenido
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado del pie de página
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 66
    }
    
    // Footer of the sections
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.beforeFooter.rawValue) as! BeforeFooterTableViewCell
        
        setButtonTitle(button: cell.btn_your_trip, title: Buttons.begin)
        
        return cell
    }
    
    // Se agrega la propiedad para ajustar el tamaño del encabezado al contenido
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado del encabezado
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 59
    }
    
    // Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.beforeHeader.rawValue) as! BeforeHeaderTableViewCell
        
        cell.lbl_title.text = Labels.before_travel_title
        
        return cell
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.beforeBody.rawValue, for: indexPath) as! BeforeBodyTableViewCell
        
        let item: [String: String] = before_list![indexPath.row]
        cell.lbl_body.text = item[IPIKeys.title.rawValue]
        
        return cell
    }
}
