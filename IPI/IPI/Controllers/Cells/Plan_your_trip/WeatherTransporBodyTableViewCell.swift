//
//  WeatherTransporBodyTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 3/07/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class WeatherTransporBodyTableViewCell: UITableViewCell {
    
    //MARK: - Outlet
    @IBOutlet weak var lbl_city: UILabel!
    @IBOutlet weak var lbl_text_01: UILabel!
    @IBOutlet weak var lbl_text_02: UILabel!
    
    @IBOutlet weak var view: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
