//
//  SaveQueryPopupViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 20/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class SaveQueryPopupViewController: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var lbl_message: UILabel!
    @IBOutlet weak var btn_done: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let nat = AplicationRuntime.sharedManager.getPlanTrip()?.natCountryID, let des = AplicationRuntime.sharedManager.getPlanTrip()?.desCountryID {
            
            let fromCountry = AplicationRuntime.sharedManager.getCountry(fromID: nat, getName: true)
            let toCountry = AplicationRuntime.sharedManager.getCountry(fromID: des, getName: true)
            
            lbl_message.text = String(format: Labels.saveQuery_format, fromCountry, toCountry)
        }
        
        setButtonTitle(button: btn_done, title: Buttons.done)
        img_logo.image = UIImage(named: IPI_IMAGES.btn_save_query)
        
    }
    
    @IBAction func actionButton (_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
