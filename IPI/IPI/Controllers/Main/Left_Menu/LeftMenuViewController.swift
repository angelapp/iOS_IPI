//
//  LeftMenuViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 08/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_close_menu: UIButton!
    @IBOutlet weak var btn_before_your_trip: UIButton!
    @IBOutlet weak var btn_plan_your_trip: UIButton!
    @IBOutlet weak var btn_saved_trip: UIButton!
    @IBOutlet weak var btn_basic_concepts: UIButton!
    @IBOutlet weak var btn_about_NRC: UIButton!
    @IBOutlet weak var btn_contact_Us: UIButton!
    @IBOutlet weak var btn_edit_Profile: UIButton!
    @IBOutlet weak var btn_intro: UIButton!
    @IBOutlet weak var btn_logout: UIButton!

    @IBOutlet weak var cnt_buttons: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var scrollHeightConstraint: NSLayoutConstraint!

    // MARK: - Properties
    private let maxHeightScroll: CGFloat = 488
    private let minAllowHeightContent: CGFloat = 504

    weak var mainDelegate: MainProtocol?
    var overlayView: UIView = UIView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        overlayView = UIView(frame: self.view.frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // set content height to scroll
    override func viewDidLayoutSubviews() {
        var contentRect = CGRect.zero

        for view in scroll.subviews {
            contentRect = contentRect.union(view.frame)
        }

        scroll.contentSize = CGSize(width: self.accessibilityFrame.width, height: contentRect.size.height)
        scrollHeightConstraint.constant = cnt_buttons.frame.size.height < minAllowHeightContent ? (cnt_buttons.frame.size.height - 8) : maxHeightScroll
    }

    // MARK: - Private Functions
    private func addStyles() {

        setAspectFitToButton(buttons: btn_before_your_trip, btn_plan_your_trip,
                                      btn_saved_trip, btn_basic_concepts,
                                      btn_about_NRC, btn_contact_Us,
                                      btn_edit_Profile, btn_intro, btn_logout)

        
        //Ajusta el ancho del menú
        let screenSize = UIScreen.main.bounds
        self.revealViewController().rearViewRevealWidth = screenSize.width * 0.85

        for subView in cnt_buttons.subviews {
            if let button = subView as? UIButton {
                button.imageView?.contentMode = .scaleAspectFit
            }
        }
    }

    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {

        //Pone el fondo por defecto
        //mainDelegate?.setImageBackground(withName: nullString)

        switch sender {

        case btn_close_menu:
            self.revealViewController().revealToggle(animated: true)
            break

        case btn_before_your_trip:
            mainDelegate?.addToContainer(viewControllerID: .beforeYourTripVC)
            self.revealViewController().revealToggle(animated: true)
            break

        case btn_plan_your_trip:
            //mainDelegate?.addToContainer(viewControllerID: .planYourTripVC)
            self.revealViewController().revealToggle(animated: true)
            break

        case btn_saved_trip:
            //mainDelegate?.addToContainer(viewControllerID: .savedTripVC)
            //mainDelegate?.showToast if doesn't have a trip saved
            self.revealViewController().revealToggle(animated: true)
            break

        case btn_basic_concepts:
            mainDelegate?.addToContainer(viewControllerID: .course)
            self.revealViewController().revealToggle(animated: true)
            break

        case btn_contact_Us:
            mainDelegate?.addToContainer(viewControllerID: .contactUs)
            self.revealViewController().revealToggle(animated: true)
            break

        case btn_about_NRC:
            mainDelegate?.addToContainer(viewControllerID: .aboutUs)
            self.revealViewController().revealToggle(animated: true)
            break

        case btn_intro:
            let sb = UIStoryboard(name: StoryboardID.OnBoarding.rawValue, bundle: nil)
            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllerID.OnBoardingVC.rawValue) as! OnBoardingViewController

            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            //nextVC.backToHome = true
            present(nextVC, animated: true, completion: nil)
            self.revealViewController().revealToggle(animated: true)
            break

        case btn_edit_Profile:
            let sb = UIStoryboard(name: StoryboardID.ConfigAvatar.rawValue, bundle: nil)
            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllerID.choiceAvatarGender.rawValue) as! ChoiceAvatarGenderViewController

            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            nextVC.isEdit = true
            present(nextVC, animated: true, completion: nil)
            self.revealViewController().revealToggle(animated: true)
            break

        default:
            // Clean user data in runtime
            AplicationRuntime.sharedManager.setUserData(user: nil)

            // Delete cookies
            let storageCookies = HTTPCookieStorage.shared
            for cookie in storageCookies.cookies! {
                storageCookies.deleteCookie(cookie)
            }

            // update login state in local
            let states = StorageFunctions.getStates()
            states.isLogin = false
            StorageFunctions.saveStates(states: states)

            // Launch Auth Screen
            let sb = UIStoryboard(name: StoryboardID.Authentication.rawValue, bundle: nil)
            self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)

            // Close menu
            self.revealViewController().revealToggle(animated: true)
            break
        }
    }
}
