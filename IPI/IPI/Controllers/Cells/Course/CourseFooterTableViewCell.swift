//
//  CourseFooterTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 25/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class CourseFooterTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var cnt_footer: UIView!
    
    // MARK: - Properties
    weak var courseDelegate: CourseViewControllerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func fill_footer() {
        setButtonTitle(button: btn_next, title: Buttons.next)
    }
    
    @IBAction func nextPage(_ sender: UIButton?) {
        courseDelegate?.nextPage()
    }
}
