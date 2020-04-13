//
//  OnBoardingViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController, OnBoardingPageViewControllerDelegate {

    // MARK: - Outlets

    @IBOutlet var btn_Next: UIButton!
    @IBOutlet var btn_Skip: UIButton!

    @IBOutlet var pageControl: UIPageControl!

    // MARK: - Properties
    var onboardingPageVC: OnBoardingPageViewController?
    weak var welcomeDelegate: WelcomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateContent()
    }

    // MARK: - Functions

    func updateContent() {

        if let index = onboardingPageVC?.currentIndex {

            switch index {

            case OnboardingIndex.page_06.rawValue:
                btn_Next.setTitle(Buttons.end, for: .normal)
                btn_Next.setTitle(Buttons.end, for: .selected)
                btn_Next.setTitle(Buttons.end, for: .highlighted)

            default:
                btn_Next.setTitle(Buttons.next, for: .normal)
                btn_Next.setTitle(Buttons.next, for: .selected)
                btn_Next.setTitle(Buttons.next, for: .highlighted)
                break
            }

            pageControl.currentPage = index
        }
    }

    func didUpdatePageIndex(currentIndex: Int) {
        updateContent()
    }



    // MARK: - Actions

    @IBAction func buttonAction (_ sender : UIButton) {

        switch sender {

        case btn_Next:

            if btn_Next.titleLabel?.text == Buttons.next {
                onboardingPageVC?.forwardPage()
            }
            else {
                buttonAction(btn_Skip)
            }

            updateContent()
            break

        default:
            //Save in local that Onboarding has viwed one time
            if welcomeDelegate != nil {
                welcomeDelegate?.updateOnboardingState(withState: true)
            }

            self.dismiss(animated: true, completion: nil)
            break
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageVC = destination as? OnBoardingPageViewController {
            onboardingPageVC = pageVC
            onboardingPageVC?.onboardingDelegate = self
        }
    }
}
