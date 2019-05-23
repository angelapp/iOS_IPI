//
//  CourseViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 18/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import AVFoundation
import ObjectMapper

class CourseViewController: UIViewController, CourseViewControllerDelegate, AVAudioPlayerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var tbl_course: UITableView!
    @IBOutlet weak var btn_back: UIButton!
    
    // MARK: - Properties
    var ncrAudio: AVAudioPlayer?
    var mainDelegate: MainProtocol?
    var isPlaying = nullString
    let maxPageIndex: Int = 42
    var currentIndex: Int = 0
    
    // Propertites for inner table
    var samplesList: Array<ExampleData> = []
    var expandedSections : NSMutableSet = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        currentIndex = AplicationRuntime.sharedManager.getIndex()
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        samplesList = ExampleData().getSampleData()
        
        tbl_course.delegate = self
        tbl_course.dataSource = self
        tbl_course.tag = TABLE_COURSE
        
        //Se agrega observable para desplazar vista cuando se muestra/oculta el teclado
        NotificationCenter.default.removeObserver(Any.self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    //MARK: - Métodos para el control de eventos del teclado
    //Observer for increment contentSize of the scroll
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            tbl_course.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    //Obeserver for move frame to origin when keyboard is hiden
    @objc func keyboardWillHide(notification: NSNotification) {
        tbl_course.contentInset = UIEdgeInsets.zero
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
        self.tbl_course.reloadData()
        viewDidLayoutSubviews()
    }
    
    // MARK: - Buttons Action
    @IBAction func actionButtons(_ sender: UIButton) {
        
        if currentIndex > 0 {
            self.previusPage()
        }
        else {
            mainDelegate?.addToContainer(viewControllerID: .selectActivies)
        }
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
    
    private func reloadTable() {
        let indexPath = IndexPath(row: 0, section: 0)
        tbl_course.scrollToRow(at: indexPath, at: .top, animated: true)
        tbl_course.reloadData()
    }
    
    // MARK: - Course Delegate
    func showMessagePopup(message: String, inbold: String?, type: PopupMessage){
        let sb = UIStoryboard(name: StoryboardID.Popup.rawValue, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllerID.courseMessage.rawValue) as! CourseMessagesViewController
        
        nextVC.message = message
        nextVC.inBold = inbold
        //nextVC.courseDelegate = self
        nextVC.poupMessage = type
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
    
    func previusPage(){
        if ncrAudio != nil && (ncrAudio?.isPlaying)! {
            stopAudio(audio: isPlaying)
        }
        
        guard currentIndex > 0 else { return }
		
		currentIndex -= 1
		AplicationRuntime.sharedManager.setProgress(progress: currentIndex)
        
        reloadTable()
    }
    
    func nextPage(){
        if ncrAudio != nil && (ncrAudio?.isPlaying)! {
            stopAudio(audio: isPlaying)
        }
        
        guard currentIndex < maxPageIndex else { return }
		
		currentIndex += 1
        AplicationRuntime.sharedManager.setProgress(progress: currentIndex)
        
        reloadTable()
    }
    
    func playMV(urlStr: String){
        self.playVideo(videoSTR: urlStr)
    }
    
    func audioManager(audioID id: Int, play: Bool) {
        let audioName = get_AudioName(forAudio: id)
        play ? playAudio(audio: audioName) : stopAudio(audio: audioName)
    }
    
    /// Envia al servidor los datos de la actividad completada
    func sendRequest(formModel: Array<RequestCompleted>) {
        
        let loader = LoadingOverlay(text: LoaderStrings.recording)
        let json = Mapper().toJSONString(formModel, prettyPrint: true)
        let token = NetworkConfig.token + AplicationRuntime.sharedManager.getUserToken()
        let apiURL = NetworkPOST.USER_PROGRESS_LIST
        let method: NetworkRestMethods = .methodPOST
        
        var headers:[[String:String]] = []
        headers.append([NetworkConfig.headerName: NetworkConfig.headerAuthorization,
                        NetworkConfig.headerValue: token])
        
        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false
        
        Network.buildRequest(urlApi: apiURL, json: json, extraHeaders: headers, method: method, completion: { (response) in
            
            loader.hideOverlayView()
            self.view.isUserInteractionEnabled = true
            
            switch response {
                
            case .succeeded(let succeed, let message):
                if !succeed {
                    printDebugMessage(tag: message)
                    self.showErrorMessage(withMessage: message)
                }
                break
                
            case .error(let error):
                print(error.debugDescription)
                break
                
            default:
                break
            }
        })
    }
    
    // MARK: - AVAudioPlayer Delegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        tbl_course.reloadData()
    }
    
    // MARK: - TableView delegate and datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == TABLE_COURSE {
            return 1
        }
        else {
            return samplesList.count
        }
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == TABLE_COURSE {
            return 1
        }
        else {
            return expandedSections.contains(section) ? 1 : 0
        }
    }
    
    // Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		
		let tableID = tableView.tag 
		var title = nullString
		
        if tableID == TABLE_COURSE {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.courseHeader.rawValue) as? CourseHeaderTableViewCell
            var cutoff = true
			
			switch currentIndex {
				
				case 1...12:
					title = "Módulo 1. \(IPI_COURSE.MODULE_01)"
					break
					
				case 14...22:
					title = "Módulo 2. \(IPI_COURSE.MODULE_02)"
					break
					
				case 22...42: 
					title = "Módulo 3. \(IPI_COURSE.MODULE_03)"
					break
				
				default:
					cutoff = false
					break
			}
		
			cell?.headerTitle = title
            cell?.fill_header(forTable: tableID, withCutoff: cutoff)
            
            return cell
		}
		else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.header.rawValue) as? CourseHeaderTableViewCell
            
			cell?.headerTitle = samplesList[section].header
			cell?.btn_openClose.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
			cell?.btn_openClose.tag = section
			cell?.btn_openClose.isSelected = expandedSections.contains(section)
            cell?.fill_header(forTable: tableID)
            
            return cell
		}
    }
	
	// Se agrega la propiedad para ajustar el tamaño del encabezado al contenido
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado del encabezado
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 66
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Samples inside of a course
        guard tableView.tag != TABLE_SAMPLES else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.boby.rawValue) as! CourseBodyTableViewCell
            
            cell.lbl_text.text = samplesList[indexPath.section].body[indexPath.row]
            
            return cell
        }
        
        // Course
        var cell: CourseTableViewCell
        
        printDebugMessage(tag: " tv: \(indexPath.row) index\(currentIndex)")
        
        if currentIndex == CURSO_PTN.PAGE_01.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellID.COURSE01.rawValue, for: indexPath) as! CourseTableViewCell
            
            cell.courseDelegate = self
            cell.fill_CELL_01()
            return cell
        }
        else if currentIndex == CURSO_PTN.PAGE_02.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellID.COURSE02.rawValue, for: indexPath) as! CourseTableViewCell
            
            cell.courseDelegate = self
            cell.fill_CELL_02()
            return cell
        }
        else if currentIndex == CURSO_PTN.PAGE_03.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellID.COURSE03.rawValue, for: indexPath) as! CourseTableViewCell
            
            cell.courseDelegate = self
            cell.fill_CELL_03()
            return cell
        }
        else if currentIndex == CURSO_PTN.PAGE_04.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellID.COURSE04.rawValue, for: indexPath) as! CourseTableViewCell
            
            cell.courseDelegate = self
            cell.fill_CELL_04()
            return cell
        }
        else /*if currentIndex == CURSO_PTN.PAGE_05.rawValue */{
            cell = tableView.dequeueReusableCell(withIdentifier: CellID.COURSE05.rawValue, for: indexPath) as! CourseTableViewCell
            
            cell.courseDelegate = self
            cell.fill_CELL_05()
            return cell
        }
//        else {
//            cell = tableView.dequeueReusableCell(withIdentifier: CellID.COURSE06.rawValue, for: indexPath) as! CourseTableViewCell
//
//            cell.courseDelegate = self
//            cell.fill_CELL_06()
//
//            return cell
//        }
    }
}
