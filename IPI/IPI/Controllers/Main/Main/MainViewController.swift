//
//  MainViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 11/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainProtocol {

    // MARK: - Outlets
    @IBOutlet weak var btn_menu: UIButton!
    @IBOutlet weak var btn_progress: UIButton!        //Show progress (tag 0) or show suggestions (tag 1)
    @IBOutlet weak var btn_change: UIButton!          //Buttton for change countries

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var planYourTrip_buttons: UIView!  //This view content icons and buttons for Plan Your Trip

    @IBOutlet weak var img_arrow:  UIImageView!
    @IBOutlet weak var img_marker: UIImageView!
    @IBOutlet weak var img_person: UIImageView!

    @IBOutlet weak var lbl_nat_country: UILabel!      // Country Origin
    @IBOutlet weak var lbl_des_country: UILabel!      // Country Destination

    // MARK: - Properties
    let PROGRESS_TAG = 0
    let SUGGESTIONS_TAG = 1

    var logView: [ViewControllerID]! = []

    // Controllers that are managed by this controller
    var aboutNRCVC: AboutUsViewController!
    var beforeVC: BeforeTravelViewController!
    var courseVC: CourseViewController!
    var contactFormVC: ContactUsViewController!
    var selectActivitiesVC: SelectActivitiesViewController!
    var selectCountriesVC: SelectCountriesViewController!
    var planYourTripOptionsVC: PlanYourTripMenuViewController!
    var planYourTripVC: PlanYourTripViewController!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegae to runtime
        AplicationRuntime.sharedManager.mainDelegate = self

        // Load Course Progress
        AplicationRuntime.sharedManager.setProgress(progress: StorageFunctions.getProgress())

        //Add Geture for open/close menu
        if self.revealViewController() != nil {
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
        
        // Set propertis to button image
        setAspectFitToButton(buttons: btn_change)

        // init viewController child
        initChildView()
    }

    // MARK: - Actions
    @IBAction func showMenu(_ sender: UIButton) {
        self.dismissKeyboard()
        self.revealViewController().revealToggle(self)
    }

    @IBAction func showProgress(_ sender: UIButton) {
        
        switch btn_progress.tag {
            
        case PROGRESS_TAG:
            let sb = UIStoryboard(name: StoryboardID.Popup.rawValue, bundle: nil)
            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllerID.progress.rawValue) as! ProgressViewController
            
            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            present(nextVC, animated: true, completion: nil)
            break
            
        case SUGGESTIONS_TAG:
            let sb = UIStoryboard(name: StoryboardID.Popup.rawValue, bundle: nil)
            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllerID.suggestions.rawValue) as! SuggestionsPopupViewController
            
            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            present(nextVC, animated: true, completion: nil)
            break
            
        default:
            break
        }
    }

    @IBAction func changeCountries(_ sender: UIButton) {
        addToContainer(viewControllerID: .selectCountries)
    }
    
    // MARK: - Private Functions
    /** init child viewControllers */
    private func initChildView() {
        aboutNRCVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.aboutUs.rawValue) as? AboutUsViewController
        beforeVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.beforeYourTripVC.rawValue) as? BeforeTravelViewController
        courseVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.course.rawValue) as? CourseViewController
        contactFormVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.contactUs.rawValue) as? ContactUsViewController
        selectActivitiesVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.selectActivies.rawValue) as? SelectActivitiesViewController
        selectCountriesVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.selectCountries.rawValue) as? SelectCountriesViewController
        planYourTripOptionsVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.planYourTripMenu.rawValue) as? PlanYourTripMenuViewController
        planYourTripVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.planYourTrip.rawValue) as? PlanYourTripViewController

        addToContainer(viewControllerID: .selectActivies)
    }

    /** Return: viewController, add delegates and properties as appropriate */
    private func getViewController(viewControllerID id: ViewControllerID) -> UIViewController {

        switch id {

        case .aboutUs:
            return aboutNRCVC

        case .beforeYourTripVC:
            return beforeVC

        case .course:
            return courseVC

        case .contactUs:
            return contactFormVC

        case .selectCountries:
			return selectCountriesVC

        case .planYourTripMenu:
            return planYourTripOptionsVC

        case .planYourTrip:
            return planYourTripVC

        default:
            return selectActivitiesVC
        }
    }

    /** Show or hidde navigation bar option, depend on current view
    - Parameter forView: ID de la vista a mostar.
    **/
    private func configNavBarOptions(forView id: ViewControllerID) {
        switch id {

            case .aboutUs:
                self.updateViewBackground(newColor: .groupTableViewBackground)
                planYourTrip_buttons.isHidden = true
                btn_progress.isHidden = true
                break

            case .course:
                self.updateViewBackground(newColor: Colors().getColor(from: ConseColors.yellow_dark.rawValue))
                self.planYourTrip_buttons.isHidden = true
                btn_progress.tag = PROGRESS_TAG
                btn_progress.isHidden = false
                updateButtonImage()
                break

            case .planYourTrip, .planYourTripMenu:
                self.updateViewBackground()
                self.planYourTrip_buttons.isHidden = false
                btn_progress.tag = SUGGESTIONS_TAG
                btn_progress.isHidden = false
                updateButtonImage()
                break

            default:
                self.updateViewBackground()
                self.planYourTrip_buttons.isHidden = true
                btn_progress.isHidden = true
                break
        }
    }

    /** Cambia el color de fondo de la vista principal
        - Parameter newColor: Nuevo Color **/
    private func updateViewBackground(newColor: UIColor? = nil){
        // Set default color
        guard newColor != nil else {
             self.view.backgroundColor = Colors().getColor(from: ConseColors.background_blue.rawValue)
             return
        }
        // Set new color
        self.view.backgroundColor = newColor
    }
    
    private func updateButtonImage() {
        let imgName = btn_progress.tag == PROGRESS_TAG ? IPI_IMAGES.btn_progress : IPI_IMAGES.btn_suggestions
        setButtonImages(button: btn_progress, normal: imgName, hover: nullString)
    }

    // MARK: - Main Delegate
    
    /** - Returns: ViewController **/
    func getMainViewController() -> UIViewController {
        return self
    }
    
    func prepareYourTrip() {
        // Load local states
        let states = StorageFunctions.getStates()
        
        // Check if it's necesry show before
        if states.hasViewedBefore {
            addToContainer(viewControllerID: .selectCountries)
        }
        else {
            states.hasViewedBefore = true
            StorageFunctions.saveStates(states: states)
            
            addToContainer(viewControllerID: .beforeYourTripVC)
        }
    }
    
    /** Add a view controller as container child */
    func addToContainer(viewControllerID id: ViewControllerID) {

        printDebugMessage(tag: "load: \(id.rawValue)")
        let vc = getViewController(viewControllerID: id)
        
        //Config navigation bar
        configNavBarOptions(forView: id)

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
    
    /** Set data of query */
    func setDataQuery(fromCountry origin: String, toCountry destination: String){
        lbl_nat_country.text = origin
        lbl_des_country.text = destination
    }
    

    /** Mostar mensajes en el main */
    func showMessageInMain(withMessage msn: String) {
        self.showErrorMessage(withMessage: msn)
    }

    func showToastInMain (withMessage msn: String){
        self.view.makeToast(message: Labels.progress_toast_message,
                            duration: HRToastDefaultDuration,
                            position: HRToastPositionDefault as AnyObject)
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
