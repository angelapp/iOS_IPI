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
    @IBOutlet weak var btn_progress: UIButton!

    @IBOutlet weak var container: UIView!

    // MARK: - Properties
    var logView: [ViewControllerID]! = []

    // Controllers that are managed by this controller
    var aboutNRCVC: AboutUsViewController!
    var courseVC: CourseViewController!
    var contactFormVC: ContactUsViewController!
    var selectActivitiesVC: SelectActivitiesViewController!

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

        // init viewController child
        initChildView()
    }

    // MARK: - Actions
    @IBAction func showMenu(_ sender: UIButton) {
        self.dismissKeyboard()
        self.revealViewController().revealToggle(self)
    }

    @IBAction func showProgress(_ sender: UIButton) {
        let sb = UIStoryboard(name: StoryboardID.Popup.rawValue, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllerID.progress.rawValue) as! ProgressViewController

        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }

    // MARK: - Private Functions
    /** init child viewControllers */
    private func initChildView() {
        aboutNRCVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.aboutUs.rawValue) as? AboutUsViewController
        courseVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.course.rawValue) as? CourseViewController
        contactFormVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.contactUs.rawValue) as? ContactUsViewController
        selectActivitiesVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.selectActivies.rawValue) as? SelectActivitiesViewController

        addToContainer(viewControllerID: .selectActivies)
    }

    /** Return: viewController, add delegates and properties as appropriate */
    private func getViewController(viewControllerID id: ViewControllerID) -> UIViewController {

        switch id {

        case .aboutUs:
            self.updateViewBackground(newColor: .groupTableViewBackground)
            btn_progress.isHidden = true
            return aboutNRCVC
            
        case .course:
            self.updateViewBackground(newColor: Colors().getColor(from: ConseColors.background_gray.rawValue))
            btn_progress.isHidden = false
            return courseVC
            
        case .contactUs:
            self.updateViewBackground()
            btn_progress.isHidden = true
            return contactFormVC

//        case .videoPlayer:
//            btn_progress.isHidden = false
//            return videoPlayerVC

        default:
            self.updateViewBackground()
            btn_progress.isHidden = true
            return selectActivitiesVC
        }
    }

    /** Cambia el color de fondo de la vista principal
        newColor: Nuevo Color **/
    private func updateViewBackground(newColor: UIColor? = nil){
        // Set default color
        guard newColor != nil else {
             self.view.backgroundColor = Colors().getColor(from: ConseColors.background_blue.rawValue)
             return
        }
        // Set new color
        self.view.backgroundColor = newColor
    }

    // MARK: - Main Delegate
    /** Add a view controller as container child */
    func addToContainer(viewControllerID id: ViewControllerID) {

        let vc = getViewController(viewControllerID: id)

//        // continue is new vc to add is diferent to current top vc
//        guard logView.last != id else {
//            return
//        }

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

    /** Mostar mensajes en el main */
    func showMessageInMain(withMessage msn: String) {
        self.showErrorMessage(withMessage: msn)
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
