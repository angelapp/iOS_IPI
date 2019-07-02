//
//  PhonebookViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class PhonebookViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tbl_phonebook: UITableView!
    
    //Properties
    var coutryName: String = nullString
    
    // Phonebook list
    var city: City!
//    var phoneList: Array<CorporatePhoneBook>!
//    var phoneListByType: Array<OrganizationType>!
    
    // Expandable
    var expandedSections : NSMutableSet = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        phoneList = AplicationRuntime.sharedManager.getPlanTrip()?.phonebook
//        countyID = AplicationRuntime.sharedManager.getPlanTrip()?.desCountryID
//
//        if countyID != nil {
//            coutryName = AplicationRuntime.sharedManager.getCountry(fromID: countyID, getName: true)
//        }
//
//        lbl_Message.text = String(format: Formats.selectCityFormat, coutryName)
    }
    
//    func showCitySelector() {
//
//        self.v_selectCity.isHidden = false
//        self.tbl_phonebook.isHidden = true
//
//        cityList = getCities(fromPhonebook: phoneList)
//    }
//
//    func getCities(fromPhonebook: Array<CorporatePhoneBook>!) -> Array<City> {
//        var cities: Array<City> = []
//
//        return cities
//    }

    
    // MARK: - Navigation
     @objc func openCall(sender : IPITapGesture) {
        
        let number = sender.phoneNumber.components(separatedBy: .whitespaces).joined()
        
        if let url = URL(string: String(format: Formats.callFormat, number)), UIApplication.shared.canOpenURL(url) {
            
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        else {
            showErrorMessage(withMessage: ErrorMessages.disabledAction)
        }
    }
}
