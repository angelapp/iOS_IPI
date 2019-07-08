//
//  ProgressViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 25/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var levelProgress: UITableView!
    
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var img_progresslogo: UIImageView!
    @IBOutlet weak var progressTitle: UILabel!
    @IBOutlet weak var progressMessage: UILabel!
    @IBOutlet weak var progressTab: UILabel!
    
    // MARK: - Properties
    private let mod_2: Int = 1
    private let mod_3: Int = 2
    private let courseID: Int = 1
    
    var progress: Array<ModuleProgressItem> = []
    weak var mainDelgate = AplicationRuntime.sharedManager.mainDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set properties to button
        btn_back.setImage(UIImage(named: IPI_IMAGES.btn_back_yellow), for: .normal)
        btn_back.imageView?.contentMode = .scaleAspectFit
        
        // Load Images
        img_progresslogo.image = UIImage(named: IPI_IMAGES.progress_logo)
        
        // Load labels
        progressTitle.text = Labels.progress_title
        progressMessage.text = Labels.progress_message
        progressTab.text = IPI_COURSE.MODULE_01
        
        // Load Progress
        progress = getProgress(forCourse: courseID)
    }
    
    // MARK: - Gestures
    @objc func imageTapped (sender: UITapGestureRecognizer) {
        
        let imgTapped = sender.view!
        let imgTag = imgTapped.tag
        
        // EL valor por defecto del indice es la pagina inicial
        var index: Int = 0
        
        switch imgTag {
            
            case mod_2:
                index = CURSO_PTN.PAGE_14.rawValue
                break
            
            case mod_3:
                index = CURSO_PTN.PAGE_26.rawValue
                break
            
            default:
                break
        }
        
        if imgTag > 0, progress[imgTag - 1].progress < 1 {
            // Show upload avatar message
            self.view.makeToast(message: Labels.progress_toast_message,
                                duration: HRToastDefaultDuration,
                                position: HRToastPositionDefault as AnyObject)
        }
        else {
            displayModule(index: index)
        }
    }
    
    // MARK: - Funtions
    func displayModule(index: Int){
        let vc: ViewControllerID = .course
        
        AplicationRuntime.sharedManager.setProgress(progress: index)
        mainDelgate?.addToContainer(viewControllerID: vc)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - TableView delegate and datasource
    
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progress.count
    }
    
    // tamaño de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.progress.rawValue) as! ProgressTableViewCell
        let progess = progress[indexPath.row].progress
        
        cell.img_insignia.alpha = progess == 1 ? 1 : 0.5
        cell.img_insignia.image = UIImage(named: progress[indexPath.row].image)
        cell.lbl_level.text = progress[indexPath.row].title
        cell.progressBar.heightAnchor.constraint(equalToConstant: 20)
        cell.progressBar.setProgress(progress[indexPath.row].progress, animated: false)
        
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        cell.img_insignia.tag = indexPath.row
        cell.img_insignia.isUserInteractionEnabled = true
        cell.img_insignia.addGestureRecognizer(tapImage)
        
        return cell
    }
}
