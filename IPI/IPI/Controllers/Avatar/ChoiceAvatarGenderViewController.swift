//
//  ChoiceAvatarGenderViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 07/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class ChoiceAvatarGenderViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var btn_man: UIButton!
    @IBOutlet weak var btn_woman: UIButton!
    @IBOutlet weak var btn_dismiss: UIButton!

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_message: UILabel!

    // MARK: - Properties
    var isEdit: Bool = false

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add buttons style
        //setAspectFitToButton(buttons: btn_man, btn_woman)

        // Fill labels
        lbl_title.text = AvatarStrings.title
        lbl_message.text = AvatarStrings.message

        // Add gesture for go back (Add only in edit Mode)
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left

        if isEdit {view.addGestureRecognizer(edgePan)}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action for Gestures
    // Acction for go back with a gesture
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .ended {

            //remove gesture one by one from view
            if let gestures = self.view.gestureRecognizers {
                for gesture in gestures {
                    self.view.removeGestureRecognizer(gesture)
                }
            }

            self.dismiss(animated: true, completion: nil)
        }
    }

    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {
        let avatar = MyAvatarPieces()
        avatar.genderID = sender == btn_man ? AvatarGenderIDs.male.rawValue : AvatarGenderIDs.female.rawValue
        AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: avatar)
        performSegue(withIdentifier: segueID.makeYourAvatar, sender: self)
    }
}
