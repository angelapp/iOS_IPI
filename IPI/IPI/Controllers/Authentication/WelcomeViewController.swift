//
//  WelcomeViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import AVKit
import UIKit
import ObjectMapper

class WelcomeViewController: UIViewController, WelcomeViewControllerDelegate, UIGestureRecognizerDelegate {

    // MARK: - Outlets
    var btn_signin: UIButton!
    var btn_signup: UIButton!
    var btn_continue: UIButton!
    
    
    

    
    // MARK: - Properties
    var avatar: UIImage!
    var avatarPieces: MyAvatarPieces!
    var states: StatesModel!
    var userData: RegisterUserResponse!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lbl_title.text = Labels.welcome
        
        
        setButtons()
        loadLocalData()
        getConfiguration()
    }


    override func viewDidAppear(_ animated: Bool) {

        // Check if the onboarding has viewed some time
        if (states != nil && states.hasViewedOnboarding) {
            return
        }

        // Show onboarding
        let storyboard = UIStoryboard(name: StoryboardID.OnBoarding.rawValue, bundle: nil)
        if let onboardingVC = storyboard.instantiateViewController(withIdentifier: ViewControllerID.OnBoardingVC.rawValue) as? OnBoardingViewController {
            onboardingVC.welcomeDelegate = self
            present(onboardingVC, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Welcome Delegate

    /// Update the state when user has viwed the onbording
    func updateOnboardingState(withState state:Bool){
        states.hasViewedOnboarding = true
        StorageFunctions.saveStates(states: states)

        viewDidAppear(true)
    }

    // MARK: - private functions
    private func loadLocalData() {

        // Set data to runtime
        AplicationRuntime.sharedManager.setAppConfig(config: StorageFunctions.getAppConfig())
        AplicationRuntime.sharedManager.setUserData(user: StorageFunctions.getUser())

        states = StorageFunctions.getStates()
        avatarPieces = StorageFunctions.getAvatarPieces()
        avatar = StorageFunctions.loadAvatarImage()

        // Activa una instancia para activar el sonido multimadia de la App cuando
        // El dispositivo está en mute
        do {
            if #available(iOS 10.0, *) {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            } else {
                // Fallback on earlier versions
                AVAudioSession.sharedInstance().perform(NSSelectorFromString("setCategory:error:"), with: AVAudioSession.Category.playback)
            }
            try AVAudioSession.sharedInstance().setActive(true)        }
        catch {
            // report for an error
            print(error)
        }
    }

    private func startCose() {

        // checks if App's configuration has already been loaded into runtime
        guard (AplicationRuntime.sharedManager.getAppConfig()) != nil else {
            return
        }


        //checks if the user has been signed in at some time
        guard states != nil, states.isLogin  else {
            return
        }

        guard (AplicationRuntime.sharedManager.getUser()) != nil else {

            // Update state from login state in local
            states.isLogin = false
            StorageFunctions.saveStates(states: states)
            return
        }

        // checks if the user has created an Avatar.
        guard self.avatarPieces != nil && self.avatarPieces.genderID != nil else {

            // Update state from avatar in local variables
            states.isThereAnAvatar = false
            StorageFunctions.saveStates(states: states)

            // Start avatar maker
            self.presentConse(storyBoard: StoryboardID.ConfigAvatar.rawValue)
            return
        }

        // Set Avatar to runtime
        AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: self.avatarPieces)
        AplicationRuntime.sharedManager.setAvatarImage(img: self.avatar)

        // Launch Home
        self.presentConse(storyBoard: StoryboardID.Main.rawValue)
    }

    /**
    Config the Next view to launch

    - Parameter storyBoard: Storyboard where the view is contained.
    - Parameter inScreen: (Opcional) Name of the view
    */
    private func presentConse(storyBoard sbName: String, inScreen vc: String? = nil){
        let sb = UIStoryboard(name: sbName, bundle: nil)
        if vc != nil {
            self.present(sb.instantiateViewController(withIdentifier: vc!), animated: true, completion: nil)
        }
        else{
            self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
        }
    }
    

    

    
    
    
    
    


    private func getConfiguration() {

        let loader = LoadingOverlay(text: LoaderStrings.configApp)
        let headers: [[String:String]] = []

        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false

        Network.buildRequest(urlApi: NetworkGET.APP_CONFIGURATION, json: nullString, extraHeaders: headers, method: .methodGET, completion: {(response) in

            loader.hideOverlayView()
            self.view.isUserInteractionEnabled = true

            switch response {

            case .succeeded(let succeed, let message):
                if !succeed, !message.isEmpty {
                    print(message)
                }
                self.startCose()
                break

            case .error(let error):
                print(error.debugDescription)
                break

            case .succeededObject(let objReceiver):

                let config = Mapper<ApplicationConfiguration>().map(JSON: objReceiver as! [String: Any])

                // Save configuration data in Local and set to runtime
                AplicationRuntime.sharedManager.setAppConfig(config: config!)
                StorageFunctions.saveAppConfigInLocal(config: config!)

                self.startCose()
                break

            default:
                break
            }
        })
    }
    
    
    
    private func setButtons(){
        
        
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        
        
        
        let centerImage = (midX - view.frame.width / 4)
        let centerYImage = (midY - view.frame.height / 3)
        
        let imageName = "logo.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: centerImage, y: centerYImage, width: view.frame.width / 2.0, height: view.frame.width / 2.0)
        view.addSubview(imageView)
        
        
        let label = UILabel(frame: CGRect(x: 0, y: imageView.frame.height + 30, width: view.frame.width, height: 70))
        label.textAlignment = .center
        label.textColor = .white
        label.text = Labels.welcome
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        
        btn_continue = UIButton(frame:CGRect(x: 0, y: 0, width: 230, height: 70))
        btn_continue.backgroundColor = Colors().getColor(from: ConseColors.button.rawValue)
        btn_continue.setTitle("Continuar sin registrarse", for: .normal)
        btn_continue.isUserInteractionEnabled = true
        btn_continue.addTarget(self, action:#selector(goToHome(_:)), for: .touchDown)
        btn_continue.layer.cornerRadius = 5
        btn_continue.layer.borderWidth = 1
        btn_continue.layer.borderColor = Colors().getColor(from: ConseColors.button.rawValue).cgColor
        view.addSubview(btn_continue)
        btn_continue.translatesAutoresizingMaskIntoConstraints = false
        btn_continue.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn_continue.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15).isActive = true
        btn_continue.widthAnchor.constraint(equalToConstant: 300).isActive = true
        btn_continue.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        btn_signin = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 70))
        btn_signin.backgroundColor = Colors().getColor(from: ConseColors.button.rawValue)
        btn_signin.setTitle("Regístrate", for: .normal)
        btn_signin.layer.cornerRadius = 5
        btn_signin.layer.borderWidth = 1
        btn_signin.layer.borderColor = Colors().getColor(from: ConseColors.button.rawValue).cgColor
        btn_signin.addTarget(self, action:#selector(goToRegister(_:)), for: .touchDown)
        view.addSubview(btn_signin)
        btn_signin.translatesAutoresizingMaskIntoConstraints = false
        btn_signin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn_signin.topAnchor.constraint(equalTo: btn_continue.bottomAnchor, constant: 15).isActive = true
        btn_signin.widthAnchor.constraint(equalToConstant: 300).isActive = true
        btn_signin.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    
        btn_signup = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 70))
        btn_signup.backgroundColor = Colors().getColor(from: ConseColors.background_blue.rawValue)
        btn_signup.setTitle("O Inicia Sesión", for: .normal)
        btn_signup.layer.cornerRadius = 5
        btn_signup.layer.borderWidth = 1
        btn_signup.layer.borderColor = Colors().getColor(from: ConseColors.background_blue.rawValue).cgColor
        btn_signup.addTarget(self, action:#selector(signUp(_:)), for: .touchDown)
        view.addSubview(btn_signup)
        btn_signup.translatesAutoresizingMaskIntoConstraints = false
        btn_signup.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn_signup.topAnchor.constraint(equalTo: btn_signin.bottomAnchor, constant: 15).isActive = true
        btn_signup.widthAnchor.constraint(equalToConstant: 300).isActive = true
        btn_signup.heightAnchor.constraint(equalToConstant: 50).isActive = true
        


        
 
    }


    
    @objc func goToRegister(_ sender: Any) {
        print("Button singIn pressed")
        self.performSegue(withIdentifier: "signup", sender: sender)
    }
    
    
    @objc func signUp(_ sender: Any) {
        print("Button signUp pressed")
        self.performSegue(withIdentifier: "signin", sender: sender)
    }
    
    
    @objc func goToHome(_ sender:UITapGestureRecognizer){
        print("Button goToHome pressed")
        self.presentConse(storyBoard: StoryboardID.Main.rawValue)
    }

}


