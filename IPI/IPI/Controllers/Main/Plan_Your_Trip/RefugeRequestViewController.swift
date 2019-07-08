//
//  RefugeRequestViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import AVFoundation

class RefugeRequestViewController: UIViewController, AVAudioPlayerDelegate, UITableViewDelegate, UITableViewDataSource, RefugeRequestViewControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var lbl_msn: UILabel!
    @IBOutlet weak var tbl_requirements: UITableView!
    
    // MARK: - Properties
    var ncrAudio: AVAudioPlayer?
    var mainDelegate: MainProtocol?
    var refugeRequest: RefugeeAplication!
    
    var originCountryID: Int!
    var targetCountryID: Int!
    
    var isHeaders = false
    var isPlaying = nullString
    
    var headers: Array<String> = []
    var expandedSections : NSMutableSet = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //Load data
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        refugeRequest = AplicationRuntime.sharedManager.getPlanTrip()?.refugee_aplication
        originCountryID = AplicationRuntime.sharedManager.getPlanTrip()?.natCountryID
        targetCountryID = AplicationRuntime.sharedManager.getPlanTrip()?.desCountryID
        
        // Build header
        if !isHeaders {
            isHeaders = true
            
            for header in RefugeRequestHeaders.asArray {
                headers.append(header.rawValue)
            }
        }
        
        var nationality = nullString
        if targetCountryID != nil {
            nationality = AplicationRuntime.sharedManager.getCountry(fromID: targetCountryID, getName: false, getNationality: true)
        }
        
        lbl_msn.text = String(format: Formats.refugeRequestFormat, nationality.dropLast() as CVarArg)
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
    
    // MARK: - Refuge request Delegate
    func audioManager(audioID id: Int, play: Bool) {
        let audioName = get_AudioName(forAudio: id)
        play ? playAudio(audio: audioName) : stopAudio(audio: audioName)
    }
    
    // MARK: - AVAudioPlayer Delegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        tbl_requirements.reloadData()
    }
    
    // MARK: - Expandable tableview functions
    //Determina la sección de la tabla que fue seleccionada para mostrar el contenido
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
        
        tbl_requirements.reloadData()
    }
    
    // MARK: - Table view Delegate and Datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
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
        
        // Get destination country name
        var country = nullString
        
        if targetCountryID != nil {
            country = AplicationRuntime.sharedManager.getCountry(fromID: targetCountryID, getName: true)
        }
        
        // make de title, formated if is necesary
        let title = section == RefugeRequestHeaders.whereToGo.asInt() ? String(format: headers[section], country) : headers[section]
        
        // Load and fill de cell
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.header.rawValue) as? CourseHeaderTableViewCell
        
        cell?.headerTitle = title
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
        
        //Change the background color for a specific header
        if section == RefugeRequestHeaders.remember.asInt() {
            cell?.cnt_header.backgroundColor = Colors().getColor(from: ConseColors.yellow_background.rawValue)
        }
        
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
    
    // Draw body
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Fill cell for Remember section
        if indexPath.section == RefugeRequestHeaders.remember.asInt() {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.bodyAvatar.rawValue) as! RefugeRequestBobyTableViewCell
            
            cell.lbl_title.text = Labels.listenAudioRefugeRequest
            
            cell.btn_audio.isSelected = false
            cell.config_button()
            
            if targetCountryID != nil {
                cell.btn_audio.tag = targetCountryID
            }
            
            cell.img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
            cell.refugeRequestDelegate = self
            
            return cell
        }
        else {
            
            var text = nullString
            
            switch indexPath.section {
                case RefugeRequestHeaders.request.asInt():
                    text = refugeRequest.request!
                    break
                
                case RefugeRequestHeaders.interview.asInt():
                    text = refugeRequest.interview!
                    break
                
                case RefugeRequestHeaders.studyCase.asInt():
                    text = refugeRequest.case_study!
                    break
                
                case RefugeRequestHeaders.notification.asInt():
                    text = refugeRequest.notification!
                    break
                
                default:
                    text = refugeRequest.where_to_go!
                    break
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue) as! CourseBodyTableViewCell
            
            let htmlCSSString = Formats.cssStyles + text
            cell.lbl_text.attributedText = htmlCSSString.htmlToAttributedString!
            
            return cell
        }
    }
}
