//
//  BeforeBodyTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class BeforeBodyTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var btn_audio: UIButton!
    @IBOutlet weak var lbl_body: UILabel!
	
	@IBOutlet weak var cutoff_top: UIView!
	
    // MARK: - Properties
    weak var beforeDelegate: BeforeTravelViewControllerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func playAudio (_ sender : UIButton) {
        sender.isSelected = !sender.isSelected
        beforeDelegate?.audioManager(audioID: sender.tag, play: sender.isSelected)
    }
}
