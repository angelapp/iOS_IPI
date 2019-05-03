//
//  WelcomeViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class WelcomeViewController: UIViewController {

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

        if (states != nil && states.hasViewedOnboarding.rawValue) {
            return
        }

        let storyboard = UIStoryboard(name: StoryboardID.OnBoarding.rawValue, bundle: nil)
        if let onboardingVC = storyboard.instantiateViewController(withIdentifier: ViewControllerID.OnBoardingVC.rawValue) as? OnBoardingViewController {
            present(onboardingVC, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - private functions
    private func loadLocalData() {
        //AplicationRuntime.sharedManager.setAppConfig(config: StorageFunctions.getAppConfig())
        //AplicationRuntime.sharedManager.setUserData(user: StorageFunctions.getUser())
        states = StorageFunctions.getStates()
        avatarPieces = StorageFunctions.getAvatarPieces()
        avatar = StorageFunctions.loadAvatarImage()

        // Activa una instancia para activar el sonido multimadia de la App cuando
        // El dispositivo está en mute
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }
        catch {
            // report for an error
        }
    }

    private func startCose() {

        guard (AplicationRuntime.sharedManager.getAppConfig()) != nil else {
            return
        }

        guard states != nil, states.isLogin  else {
            return
        }

        guard (AplicationRuntime.sharedManager.getUser()) != nil else {
            states.isLogin = false
            StorageFunctions.saveStates(states: states)
            return
        }

//        guard self.contacts != nil && self.contacts.count > 0 else {
//            self.presentConse(storyBoard: StoryboardsId.configAlert, inScreen: ViewControllersId.configAlert)
//            return
//        }

//        AplicationRuntime.sharedManager.setTrustedConctacs(list: self.contacts)

//        guard self.avatarPieces != nil && self.avatarPieces.skinID != nil else {
//            self.presentConse(storyBoard: StoryboardsId.configAlert, inScreen: ViewControllersId.choiceAvatarGender)
//            return
//        }

//        AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: self.avatarPieces)
//        AplicationRuntime.sharedManager.setAvatarImage(img: self.avatar)

        self.presentConse(storyBoard: StoryboardsId.main)
    }

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

        //let loader = LoadingOverlay(text: LoaderStrings.configApp)
        let headers: [[String:String]] = []

        //loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false

        Network.buildRequest(urlApi: NetworkGET.APP_CONFIGURATION, json: nullString, extraHeaders: headers, method: .methodGET, completion: {(response) in

            //loader.hideOverlayView()
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
            /*
                let config = Mapper<ApplicationConfiguration>().map(JSON: objReceiver as! [String: Any])

                AplicationRuntime.sharedManager.setAppConfig(config: config!)
                StorageFunctions.saveAppConfigInLocal(config: config!)

                self.startCose()
            */
                break

            default:
                break
            }
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
