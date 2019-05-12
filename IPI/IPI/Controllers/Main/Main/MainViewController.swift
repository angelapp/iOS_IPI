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

    // MARK: - Properties
    var logView: [ViewControllerID]! = []

    // Controllers that are managed by this controller
    var aboutNRCVC: AboutUsViewController!
    var contactFormVC: ContactUsViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegae to runtime
        AplicationRuntime.sharedManager.mainDelegate = self
        
        //Add Geture for open/close menu
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
    }
    
    // MARK: - Actions
    @IBAction func showMenu(_ sender: UIButton) {
        self.dismissKeyboard()
        self.revealViewController().revealToggle(self)
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
