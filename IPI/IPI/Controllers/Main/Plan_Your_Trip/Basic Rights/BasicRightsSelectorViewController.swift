//
//  BasicRightsSelectorViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 6/07/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class BasicRightsSelectorViewController: UIViewController {
    
    // MARK: - Outlets
    // Buttons
    @IBOutlet weak var btn_selectCondition: UIButton!
    @IBOutlet weak var btn_pickerCancel: UIButton!
    @IBOutlet weak var btn_pickerConfirm: UIButton!
    
    // Labels
    @IBOutlet weak var lbl_Message: UILabel!
    @IBOutlet weak var promt_condition: UILabel!
    
    // Pickers
    @IBOutlet weak var picker: UIPickerView!
    
    // Views
    @IBOutlet weak var cnt_picker: UIView!
    @IBOutlet weak var selector_condition: UIView!

	var migrationConditionList: Array<MigrationConditionType> = []

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

}
