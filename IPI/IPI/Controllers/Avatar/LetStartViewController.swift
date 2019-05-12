//
//  LetStartViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 07/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class LetStartViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var img_avatar: UIImageView!
    @IBOutlet weak var lbl_mesasage: UILabel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Show upload avatar message
        self.view.makeToast(message: AvatarStrings.uploadSuccess,
                            duration: HRToastDefaultDuration,
                            position: HRToastPositionTop as AnyObject)

        // set Tittle
        setButtonTitle(button: btn_next, title: Buttons.start)

        // load avatar
        img_avatar.image = StorageFunctions.loadAvatarImage()

        // fill lables
        lbl_mesasage.text = AvatarStrings.letStartMessage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton){
        let sb = UIStoryboard(name: StoryboardID.Main.rawValue, bundle: nil)
        self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
    }
}
