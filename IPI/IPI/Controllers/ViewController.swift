//
//  ViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 20/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: IPIKeys.hasViewedOnboarding.rawValue) {
            return
        }
        
        let storyboard = UIStoryboard(name: StoryboardID.OnBoarding.rawValue, bundle: nil)
        if let onboardingVC = storyboard.instantiateViewController(withIdentifier: ViewControllerID.OnBoardingVC.rawValue) as? OnBoardingViewController {
            present(onboardingVC, animated: true, completion: nil)
        }
    }

}

