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
    //@IBOutlet weak var btn_dismiss: UIButton!

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
        lbl_title.text = AvatarStrings.avatarTitle
        lbl_message.text = AvatarStrings.avatarMessage

        // Muestra u oculta el botón de volver
        //btn_dismiss.isHidden = !isEdit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {

        if sender == btn_dismiss {
            self.dismiss(animated: true, completion: nil)
        }
        else {
            let avatar = MyAvatarPieces()
            avatar.genderID = sender == btn_man ? AvatarGenderIDs.male.rawValue : AvatarGenderIDs.female.rawValue
            AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: avatar)
            performSegue(withIdentifier: segueID.makeYourAvatar, sender: self)
        }
    }
}
