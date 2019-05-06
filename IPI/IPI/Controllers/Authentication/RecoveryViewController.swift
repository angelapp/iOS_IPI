//
//  RecoveryViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class RecoveryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RecoveryViewControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet var recovery_tableView : UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //It's added observable to scroll view when the keyboard is shown / hidden
        NotificationCenter.default.removeObserver(Any.self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        
        // Add delegate and Data Source to itself
        self.recovery_tableView.delegate = self
        self.recovery_tableView.dataSource = self
        self.recovery_tableView.isScrollEnabled = false
        
        // Add gesture for go back
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
    }
    
    // MARK: - Action for Gestures
    
    // Acction for go back with a gesture
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .ended {
            dismiss()
        }
    }
    
    //Observer for increment contentSize in the tableView
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardFrame:CGRect = self.view.convert(keyboardSize, from: nil)
            
            var contentInset:UIEdgeInsets = self.recovery_tableView.contentInset
            contentInset.bottom = keyboardFrame.size.height
            self.recovery_tableView.contentInset = contentInset
            self.recovery_tableView.isScrollEnabled = true
        }
    }
    
    //Obeserver for move frame to origin when keyboard is hiden
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        recovery_tableView.contentInset = contentInset
        recovery_tableView.isScrollEnabled = false
    }
    
    // MARK: - TableView delegate and datasource
    
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.bounds.height < 322 {
            return UITableView.automaticDimension
        }
        else {
            return tableView.bounds.height
        }
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.recoveryPassCell.rawValue, for: indexPath) as! RecoveryTableViewCell
        
        cell.fillCell()
        cell.recoveryDelegate = self
        
        return cell
    }
    
    // MARK: - Recovery Delegate
    
    func sendMessage(withMessage msn: String) {
        self.showErrorMessage(withMessage: msn)
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /// Se envia correo del usuario para recuperar la contraseña
    func sendRecoveryPost(email: RegisterUserProfileModel) {
        
        let loader = LoadingOverlay(text: LoaderStrings.recovery)
        let json = Mapper().toJSONString(email, prettyPrint: true)
        let headers:[[String:String]] = []
        
        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false
        
        Network.buildRequest(urlApi: NetworkPOST.PASSWORD_RECOVERY, json: json, extraHeaders: headers, method: .methodPOST, completion: { (response) in
            
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
                
            case .succeededObject(let objReceiver):
                
                let resp = objReceiver as! [String: Any]
                
                self.view.makeToast(message: resp[JSONKeys.detail] as! String, duration: ToastDefaultDuration, position: HRToastPositionDefault as AnyObject)
                
                break
                
            default:
                break
            }
        })
    }
}
