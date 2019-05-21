//
//  CourseHeaderTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 18/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class CourseHeaderTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var btn_openClose: UIButton!
    
    @IBOutlet weak var cnt_header: UIView!
    @IBOutlet weak var top_line: UIView!
    @IBOutlet weak var top_botton: UIView!
    
    var headerTitle: String = nullString
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill_header(forTable id: Int) {
        
        if id == TABLE_SAMPLES {
            
        }
        
        
    }

}
