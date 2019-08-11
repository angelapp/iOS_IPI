//
//  CourseBodyTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 18/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class CourseBodyTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_text: UILabel!
    @IBOutlet weak var img_item: UIImageView!
    @IBOutlet weak var tv_text: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
