//
//  BeforeFooterTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class BeforeFooterTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var btn_your_trip: UIButton!
    
    // MARK: - Properties
    weak var mainDelegate = AplicationRuntime.sharedManager.mainDelegate
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Action
    @IBAction func action_buttons(_ sender: UIButton) {
        mainDelegate?.addToContainer(viewControllerID: .planYourTripVC)
    }
    
}
