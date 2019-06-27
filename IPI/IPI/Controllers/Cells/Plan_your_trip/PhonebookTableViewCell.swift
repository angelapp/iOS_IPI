//
//  PhonebookTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class PhonebookTableViewCell: UITableViewCell {
    
    //MARK: - Outles
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_phone: UILabel!
    @IBOutlet weak var lbl_address: UILabel!
    
    @IBOutlet weak var img_title: UIImageView!
    @IBOutlet weak var img_phone: UIImageView!
    @IBOutlet weak var img_address: UIImageView!
    
    @IBOutlet weak var btn_address: UIButton!
    
    //MARK: - Properties
    var phoneItem: CorporatePhoneBook!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell() {
        guard phoneItem != nil else {return}
        
        lbl_title.text = phoneItem.name ?? nullString
        lbl_address.text = phoneItem.address ?? nullString
        
        // Get Phone or Mobile phone
        var phone = nullString
        if phoneItem.phone != nil, phoneItem.phone != nullString {
            phone = phoneItem.phone
        }
        else if phoneItem.mobile_phone != nil, phoneItem.mobile_phone != nullString {
            phone = phoneItem.mobile_phone
        }
        
        lbl_phone.text = phone
        
        // Set Image
        img_address.image = UIImage(named: IPI_IMAGES.icon_marker)
        img_phone.image = UIImage(named: IPI_IMAGES.icon_mobile)
        img_title.image = UIImage(named: IPI_IMAGES.success_orange)
        
        setButtonImages(button: btn_address, normal: IPI_IMAGES.icon_google_maps, hover: nullString)
        setAspectFitToButton(buttons: btn_address)
        
        
    }

}
