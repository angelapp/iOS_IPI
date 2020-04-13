//
//  PhonebookTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import Karte
import CoreLocation

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
    weak var mainDelegate = AplicationRuntime.sharedManager.mainDelegate

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
        
        let imgPhone = phone == nullString ? nullString : IPI_IMAGES.icon_mobile
        lbl_phone.text = phone
        
        // Set Image
        img_phone.image = UIImage(named: imgPhone)
        img_address.image = UIImage(named: IPI_IMAGES.icon_marker)
        img_title.image = UIImage(named: IPI_IMAGES.success_orange)
        
        // Config UI for button
        setButtonImages(button: btn_address, normal: IPI_IMAGES.icon_google_maps, hover: nullString)
        setAspectFitToButton(buttons: btn_address)
        
        btn_address.isHidden = !(phoneItem.latitude != nil && phoneItem.longitude != nil)

    }
    
    @IBAction func openAddress(_ sender: UIButton){
        
        if let mainView = mainDelegate?.getMainViewController() {
            
            let coordinate = CLLocationCoordinate2D(latitude: Double((phoneItem?.latitude)!)!, longitude: Double((phoneItem?.longitude)!)!)
            let location = Location(name: phoneItem.name, address: phoneItem.address, coordinate: coordinate)
            
            Karte.presentPicker(destination: location, presentOn: mainView)
        }
    }
}
