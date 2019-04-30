//
//  SignupViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookCore
import ObjectMapper

class SignupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SignupViewControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet var singup_tableView : UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //It's added observable to scroll view when the keyboard is shown / hidden
        NotificationCenter.default.removeObserver(Any.self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        
        // Add delegate and Data Source to itself
        self.singup_tableView.delegate = self
        self.singup_tableView.dataSource = self
        
        // Add gesture for go back
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
    }
    
    // MARK: - Action for Gestures
    
    // Acction for go back with a gesture
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .ended {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //Observer for increment contentSize in the tableView
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardFrame:CGRect = self.view.convert(keyboardSize, from: nil)
            
            var contentInset:UIEdgeInsets = self.singup_tableView.contentInset
            contentInset.bottom = keyboardFrame.size.height
            self.singup_tableView.contentInset = contentInset
        }
    }
    
    //Obeserver for move frame to origin when keyboard is hiden
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        singup_tableView.contentInset = contentInset
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
        if tableView.bounds.height < 488 {
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.signupCell.rawValue, for: indexPath) as! SignupTableViewCell
        
        cell.fillCell()
        
        return cell
    }
    
    // MARK: - SignupViewControllerDelegate
    func signupRequest(email:String, password:String, confrimPass: String) {
        
    }
    
    /// Facebook Register
    func facebookSignup() {
        let fbloginManager = FBSDKLoginManager()
        fbloginManager.logIn(withReadPermissions: [FBKeys.publicProfile, FBKeys.email], from: self) { (result, error) -> Void in
            
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                
                //Check if user cancel login/register with FB
                guard !fbloginresult.isCancelled else {
                    self.showErrorMessage(withMessage: ErrorMessages.fbCanceledRegister)
                    return
                }
                
                //Check if garented permission
                if  fbloginresult.grantedPermissions != nil {
                    self.getFBData(fbloginresult: fbloginresult)
                }
                else {
                    self.showErrorMessage(withMessage: ErrorMessages.fbDeniedPermits)
                    return
                }
            }
            else {
                print("something went wrong \(error!)")
                return
            }
        }
    }
    
    func googleSignup() {
        
    }
    
    // MARK: - Functions
    //Solicita los datos del usuario Facebook para enviarlos al servidor
    func getFBData(fbloginresult : FBSDKLoginManagerLoginResult){
        FBSDKGraphRequest(graphPath: FBKeys.me, parameters: [FBKeys.fields: FBKeys.profileParams]).start(completionHandler: { (connection, resultData, error) -> Void in
            
            if (error != nil){
                print(error ?? nullString)
                return
            }
            
            //Respuesta de Facebook con los datos del usuario
            let data = resultData as! NSDictionary
            
            let user = UserModel()
            user.email = nullString
            
            if let email = data[FBDic.email] as? String {
                user.email = email
            }
            
            if let name = data[FBDic.first_name] as? String {
                
                if let lastName = data[FBDic.last_name] as? String {
                    user.name = String(format: Formats.fullName, name, lastName)
                }
                else {
                    user.name = name
                }
            }
            
            let fbToken = fbloginresult.token.tokenString
            user.accesstoken = fbToken
            
            //Lanza una vista modal para agregar datos
            let sb = UIStoryboard(name: StoryBoardID.main, bundle: nil)
            let nextVC = sb.instantiateViewController(withIdentifier: VCIdentifiers.alert) as! AlertViewController
            
            nextVC.user = user
            nextVC.placeHolder = Strings.placeholderPhone
            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            self.present(nextVC, animated: true, completion: nil)
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
