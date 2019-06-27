//
//  PhonebookViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class PhonebookViewController: UIViewController {

    //Properties
    var phoneList: Array<CorporatePhoneBook>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Gestures
    @objc func imageTapped (sender: UITapGestureRecognizer) {
        let imgTapped = sender.view!
        let imgTag = imgTapped.tag
        
        var phone = nullString
//        if phonelist[imgTag].phone != nil, phoneItem.phone != nullString {
//            phone = phoneItem.phone
//        }
//        else if phoneItem.mobile_phone != nil, phoneItem.mobile_phone != nullString {
//            phone = phoneItem.mobile_phone
//        }
    }

}
