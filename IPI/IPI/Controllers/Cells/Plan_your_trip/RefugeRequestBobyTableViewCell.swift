//
//  RefugeRequestBobyTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 22/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class RefugeRequestBobyTableViewCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var btn_audio: UIButton!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var img_avatar: UIImageView!
    
    //Properties
        var refugeRequestDelegate: RefugeRequestViewControllerDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config_button() {
        
        btn_audio.setImage(UIImage(named: IPI_IMAGES.btn_audio), for: .normal)
        btn_audio.setImage(UIImage(named: IPI_IMAGES.btn_audio_hover), for: .selected)
        
        setAspectFitToButton(buttons: btn_audio)
    }
    
    // MARK: - Audio Functions
    @IBAction func playAudio(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        refugeRequestDelegate?.audioManager(audioID: sender.tag, play: sender.isSelected)
    }
}
