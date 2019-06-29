//
//  PhonebookSelectCityViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 28/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class PhonebookSelectCityViewController: UIViewController {
    
    // MARK: - Outlets
    // Buttons
    @IBOutlet weak var btn_selectCity: UIButton!
    @IBOutlet weak var btn_pickerCancel: UIButton!
    @IBOutlet weak var btn_pickerConfirm: UIButton!
    
    // Labels
    @IBOutlet weak var lbl_Message: UILabel!
    @IBOutlet weak var promt_city: UILabel!
    
    // Pickers
    @IBOutlet weak var picker: UIPickerView!
    
    // Views
    @IBOutlet weak var cnt_picker: UIView!
    @IBOutlet weak var selector_city: UIView!
    
    //MARK: - Properties
    var countyID: Int!
    var cityList: Array<City>!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
