//
//  PlanYourTripViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 16/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import AVFoundation

class PlanYourTripViewController: UIViewController, AVAudioPlayerDelegate,  PlanYourTripViewControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_speaker: UIButton!
    @IBOutlet weak var btn_save_query: UIButton!

    @IBOutlet weak var img_icon: UIImageView!
    @IBOutlet weak var lbl_title: UILabel!

    @IBOutlet weak var container: UIView!

    // MARK: - Properties
    var logView: [Int]! = []
    var basicRightsTAG = ViewControllerID.basicRightSelector.asInt()
    var phoneBookTAG = ViewControllerID.selectCity.asInt()

    var option: PlanYourTripOptions!
    var currentCity: City!
    var currentCondition: MigrationConditionType!

    // properties for play audio
    var ncrAudio: AVAudioPlayer?
    var isPlaying = nullString

    // Controllers that are managed by this controller
    var basicRightsVC: BasicRightsViewController!
    var basicRightSelectorVC: BasicRightsSelectorViewController!
    var documentsVC: DocumentsViewController!
    var countryDataVC: CountryDataViewController!
    var migrationRequirementsVC: MigrationRequirementsViewController!
    var nationalizationRequirementsVC: NationalizationRequirementsViewController!
    var phonebookVC: PhonebookViewController!
    var selectCityVC: PhonebookSelectCityViewController!
    var refugeRequestVC: RefugeRequestViewController!
    var visasVC: VisasViewController!

    weak var mainDelegate: MainProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        mainDelegate = AplicationRuntime.sharedManager.mainDelegate

        // load current option
        option = AplicationRuntime.sharedManager.getCurrentOption()
        printDebugMessage(tag: "option tapped id: \(option.id ?? -11)\n audioID: \(option.audioID ?? -22)\n icon:\(option.icon ?? "himesama n.n")")

        // load navigation bar and init viewController child
        drawNavbar()
        initChildView()

        btn_speaker.tag = option.audioID
    }

    // MARK: - Private Functions
    /** init child viewControllers */
    private func drawNavbar(){

        // Check if exist de option, else return to Plan Your Trip Menu
        guard option != nil else {
            back(nil)
            return
        }

        img_icon.image = UIImage(named: option.logo)
        lbl_title.text = option.title
    }


    private func initChildView() {

        basicRightsVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.basicRights.rawValue) as? BasicRightsViewController
        basicRightSelectorVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.basicRightSelector.rawValue) as? BasicRightsSelectorViewController
        documentsVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.documents.rawValue) as? DocumentsViewController
        countryDataVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.countryData.rawValue) as? CountryDataViewController
        migrationRequirementsVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.migrationRequirements.rawValue) as? MigrationRequirementsViewController
        nationalizationRequirementsVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.nationalizationRequirements.rawValue) as? NationalizationRequirementsViewController
        phonebookVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.phonebook.rawValue) as? PhonebookViewController
        selectCityVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.selectCity.rawValue) as? PhonebookSelectCityViewController
        refugeRequestVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.refugeRequest.rawValue) as? RefugeRequestViewController
        visasVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.visas.rawValue) as? VisasViewController

        addToContainer(viewControllerID: option.id)
    }

    /** Return: viewController, add delegates and properties as appropriate */
    private func getViewController(viewControllerID id: Int) -> UIViewController {

        switch id {

        case PLAN_YOUR_TRIP_OPTION.BASIC_RIGHTS.rawValue:
           if basicRightsTAG == ViewControllerID.basicRights.asInt() {
                basicRightsVC.conditonSelected = currentCondition
                return basicRightsVC
            }
            else {
                basicRightSelectorVC.plantripDelegate = self
                return basicRightSelectorVC
            }

        case PLAN_YOUR_TRIP_OPTION.LIBRARY.rawValue:
            return documentsVC

        case PLAN_YOUR_TRIP_OPTION.GENERAL_COUNTRY_DATA.rawValue:
            return countryDataVC

        case PLAN_YOUR_TRIP_OPTION.MIGRATIONS_REQUIREMENTS.rawValue:
            return migrationRequirementsVC

        case PLAN_YOUR_TRIP_OPTION.NATIONALIZATION_REQUIREMENTS.rawValue:
            return nationalizationRequirementsVC

        case PLAN_YOUR_TRIP_OPTION.PHONEBOOK.rawValue:
            if phoneBookTAG == ViewControllerID.phonebook.asInt() {
                lbl_title.text = String(format: Formats.phonebookFormat, currentCity.name.uppercased())
                phonebookVC.city = currentCity
                return phonebookVC
            }
            else {
                lbl_title.text = Labels.phonebook
                selectCityVC.plantripDelegate = self
                return selectCityVC
            }

        case PLAN_YOUR_TRIP_OPTION.REFUGEE_APLICATION.rawValue:
            return refugeRequestVC

        default:
            return visasVC
        }
    }

    // MARK: - Audio Functions
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

    private func audioManager(audioID id: Int, play: Bool) {
        let audioName = get_AudioName(forAudio: id)
        play ? playAudio(audio: audioName) : stopAudio(audio: audioName)
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        //Check if the sound that finishes comes from a certain AVAudioPlayer
        if player == ncrAudio {
            btn_speaker.isSelected = !btn_speaker.isSelected
        }
    }

    // MARK: - Plan Your Trip Delegate
    /** Add a view controller as container child */
    func addToContainer(viewControllerID id: Int) {

        let vc = getViewController(viewControllerID: id)

        if container.subviews.count > 0 {
            let vc = self.children.last
            vc?.willMove(toParent: nil)
            vc?.view.removeFromSuperview()
            vc?.removeFromParent()
        }

        // Add vc as child
        addChild(vc)
        // The new vc size is adjusted to the size of the container
        vc.view.frame = CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height)
        // Add view to the container
        container.addSubview(vc.view)
        // Reload vc
        vc.viewDidLoad()
        // Set parent of vc
        vc.didMove(toParent: self)

        // Add id reference to losg view
        logView.append(id)
    }

    /** Remove of container and the reference log */
    func removeOfContainer() {

        guard logView.count > 0 else { return }

        // Delete child from parent
        let vc = self.children.last
        vc?.willMove(toParent: nil)
        vc?.view.removeFromSuperview()
        vc?.removeFromParent()

        // Delete reference in logView
        let refVC = logView.last
        let indexOF = logView.index(of: refVC!)
        logView.remove(at: indexOF!)
    }

    func showBasicRights(forCondition condition: MigrationConditionType) {
        self.currentCondition = condition
        self.basicRightsTAG = ViewControllerID.basicRights.asInt()
        self.addToContainer(viewControllerID: PLAN_YOUR_TRIP_OPTION.BASIC_RIGHTS.rawValue)
    }

    func showPhonebook(forCity city: City) {
        self.currentCity = city
        self.phoneBookTAG = ViewControllerID.phonebook.asInt()
        self.addToContainer(viewControllerID: PLAN_YOUR_TRIP_OPTION.PHONEBOOK.rawValue)
    }

    // MARK: - Action buttons
    @IBAction func back(_ sender: UIButton?) {

        //Back Action from Basic Rights
        guard basicRightsTAG != ViewControllerID.basicRights.asInt() else {
            self.basicRightsTAG = ViewControllerID.basicRightSelector.asInt()
            self.addToContainer(viewControllerID: PLAN_YOUR_TRIP_OPTION.BASIC_RIGHTS.rawValue)
            return
        }

        //Back Action from Phonebook
        guard phoneBookTAG != ViewControllerID.phonebook.asInt() else {
            self.phoneBookTAG = ViewControllerID.selectCity.asInt()
            self.addToContainer(viewControllerID: PLAN_YOUR_TRIP_OPTION.PHONEBOOK.rawValue)
            return
        }

        // Clean Container
        self.removeOfContainer()

        // Stop audio if it's playing
        if ncrAudio != nil && (ncrAudio?.isPlaying)! {
            stopAudio(audio: isPlaying)
        }

        // Show plan your trip menu (Option List)
        mainDelegate?.addToContainer(viewControllerID: .planYourTripMenu)
    }

    @IBAction func playStopAudio(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.audioManager(audioID: sender.tag, play: sender.isSelected)
    }

    @IBAction func saveQuery(_ sender: Any) {
        let plan = AplicationRuntime.sharedManager.getPlanTrip()
        StorageFunctions.savePlanTripInLocal(plan: plan!)

        let sb = UIStoryboard(name: StoryboardID.Popup.rawValue, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllerID.savedTrip.rawValue) as! SaveQueryPopupViewController

        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
}
