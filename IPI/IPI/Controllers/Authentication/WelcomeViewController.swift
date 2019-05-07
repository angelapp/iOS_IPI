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

class WelcomeViewController: UIViewController, WelcomeViewControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var btn_signin: UIButton!
    @IBOutlet weak var btn_signup: UIButton!
    @IBOutlet weak var lbl_title: UILabel!

    // MARK: - Properties
    var avatar: UIImage!
    var avatarPieces: MyAvatarPieces!
    var states: StatesModel!
    var userData: RegisterUserResponse!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

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
                try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [])
            } else {
                // Fallback on earlier versions
                AVAudioSession.sharedInstance().perform(NSSelectorFromString("setCategory:error:"), with: AVAudioSession.Category.playback)
            }
        }
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
//        let sb = UIStoryboard(name: sbName, bundle: nil)
        printDebugMessage(tag: "NextVC \(sbName)")
//        if vc != nil {
//            self.present(sb.instantiateViewController(withIdentifier: vc!), animated: true, completion: nil)
//        }
//        else{
//            self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
//        }
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
}
