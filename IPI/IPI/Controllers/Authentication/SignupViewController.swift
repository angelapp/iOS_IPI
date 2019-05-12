//
//  SignupViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import FacebookCore
import ObjectMapper

class SignupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SignupViewControllerDelegate, GIDSignInDelegate, GIDSignInUIDelegate  {

    // MARK: - Outlets
    @IBOutlet var singup_tableView : UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().clientID = ID_cliente_Google
        
        //adding the delegates
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self

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
        cell.signupDelegate = self

        return cell
    }

    // MARK: - SignupViewControllerDelegate
    func sendMessage(withMessage msn: String) {
        self.showErrorMessage(withMessage: msn)
    }

    func signupRequest(userToRegister: RegisterUserProfileModel) {

        let loader = LoadingOverlay(text: LoaderStrings.login)
        let json = Mapper().toJSONString(userToRegister, prettyPrint: true)
        let headers:[[String:String]] = []

        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false

        Network.buildRequest(urlApi: NetworkPOST.CREATE_USER, json: json, extraHeaders: headers, method: .methodPOST, completion: { (response) in

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

                let user = Mapper<RegisterUserResponse>().map(JSON: objReceiver as! [String: Any])
                let stateModel = StorageFunctions.getStates()
                stateModel.isLogin = true

                StorageFunctions.saveDataInLocal(user: user)
                StorageFunctions.saveStates(states: stateModel)

                AplicationRuntime.sharedManager.setUserData(user: user)

                //Se limpian los datos almacenados en el local
                let storage = StorageConfig.share
                storage.clearParameterFromKey(key: IPIKeys.progress.rawValue)
                storage.clearParameterFromKey(key: IPIKeys.activitiesProgress.rawValue)

                // Actualiza valores en runtime
//                AplicationRuntime.sharedManager.setProgress(progress: StorageFunctions.getProgress())

                self.launchNextView()
                break

                default:
                break
            }
        })

    }

    // MARK: - Sing up by SocialNetwork
    func signupRequest(userToRegister: SocialNetworkRegister, urlApi: String) {

        let loader = LoadingOverlay(text: LoaderStrings.signup)
        let json = Mapper().toJSONString(userToRegister, prettyPrint: true)
        let headers:[[String:String]] = []

        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false

        Network.buildRequest(urlApi: urlApi, json: json, extraHeaders: headers, method: .methodPOST, completion: { (response) in

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

                let user = Mapper<RegisterUserResponse>().map(JSON: objReceiver as! [String: Any])
                let stateModel = StorageFunctions.getStates()
                stateModel.isLogin = true

                StorageFunctions.saveDataInLocal(user: user)
                StorageFunctions.saveStates(states: stateModel)

                AplicationRuntime.sharedManager.setUserData(user: user)

                //Se limpian los datos almacenados en el local
                let storage = StorageConfig.share
                storage.clearParameterFromKey(key: IPIKeys.progress.rawValue)
                storage.clearParameterFromKey(key: IPIKeys.activitiesProgress.rawValue)

                // Actualiza valores en runtime
                //AplicationRuntime.sharedManager.setProgress(progress: StorageFunctions.getProgress())

                self.launchNextView()
                break

            default:
                break
            }
        })
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
        GIDSignIn.sharedInstance().signIn()
    }
    
    // MARK: Google Delegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        //if any error stop and print the error
        if error != nil{
            print(error.localizedDescription)
            return
        }
        
        //if success display the email on label
        printDebugMessage(tag: user.profile.email)
        printDebugMessage(tag: user.authentication.idToken)
    }

    // MARK: - Functions
    // Solicita los datos del usuario Facebook para enviarlos al servidor
    func getFBData(fbloginresult : FBSDKLoginManagerLoginResult){
        FBSDKGraphRequest(graphPath: FBKeys.me, parameters: [FBKeys.fields: FBKeys.profileParams]).start(completionHandler: { (connection, resultData, error) -> Void in

            if (error != nil){
                print(error ?? nullString)
                return
            }

            //Respuesta de Facebook con los datos del usuario
            let data = resultData as! NSDictionary

            let user = SocialNetworkRegister()
            user.email = nullString

            if let email = data[FBKeys.email] as? String {
                user.email = email
            }

            let fbToken = fbloginresult.token.tokenString
            user.access_token = fbToken

            self.signupRequest(userToRegister: user, urlApi: NetworkPOST.FACEBOOK_LOGGIN)
        })
    }

    private func launchNextView() {
        let sb = UIStoryboard(name: StoryboardID.ConfigAvatar.rawValue, bundle: nil)
        self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
    }
}
