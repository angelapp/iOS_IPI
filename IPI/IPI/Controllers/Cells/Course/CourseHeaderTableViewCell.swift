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
    @IBOutlet weak var botton_line: UIView!
    
    var headerTitle: String = nullString
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill_header(forTable id: Int, withCutoff: Bool? = false) {
        let isCutoff = !(withCutoff ?? false)
        
        if id == TABLE_SAMPLES {
			cnt_header.backgroundColor = Colors().getColor(from: ConseColors.background_gray.rawValue)
            top_line.isHidden = isCutoff
            botton_line.isHidden = isCutoff
        }
		else {
			cnt_header.backgroundColor = UIColor.white.withAlphaComponent(0.0)
            top_line.isHidden = isCutoff
            botton_line.isHidden = isCutoff
		}
		
		lbl_title.text = headerTitle
    }
}
