//
//  BasicRightsSelectorViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 6/07/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class BasicRightsSelectorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

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

    //MARK: - Properties
	var migrationConditionList: Array<MigrationConditionType>!
    var conditonSelected: MigrationConditionType!
    var plantripDelegate: PlanYourTripViewControllerDelegate?

    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load migration condition list
        if migrationConditionList == nil { loadData() }

        // Fill Labels
        lbl_Message.text = Labels.select_condition_msn
        promt_condition.text = Labels.hint_spinner

         // Config pickers
        cnt_picker.isHidden = true
        picker.delegate = self
        picker.dataSource = self
    }

    override func viewDidDisappear(_ animated: Bool) {
        migrationConditionList = []
        picker.reloadAllComponents()
    }

    private func loadData(reload: Bool? = false) {
        migrationConditionList = AplicationRuntime.sharedManager.//getCities()
        picker.reloadAllComponents()

        if reload ?? false { actionButtons(btn_selectCondition) }
    }

    /// Hidden picker view
    private func showHiddenPicker(showPicker: Bool) {
        picker.isHidden = !showPicker
        cnt_picker.isHidden =  !showPicker
    }

    private func showBasicRights() {
        plantripDelegate?showBasicRights(forCondition: conditonSelected)
    }

    // MARK: - UIPickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return migrationConditionList.count
    }

    // Set font to the label and set content
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        //custom label
        let pickerLabel = UILabel()
        pickerLabel.numberOfLines = 0
        pickerLabel.sizeToFit()
        pickerLabel.textColor = UIColor.black
        pickerLabel.textAlignment = NSTextAlignment.center

        pickerLabel.text = migrationConditionList[row].name

        return pickerLabel
    }

    //action for event onchange
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        promt_condition.text = migrationConditionList[row].name
        conditonSelected = migrationConditionList[row]
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }

    // MARK: - Action buttons
    @IBAction func actionButtons(_ sender: UIButton) {

        switch sender {

        case btn_selectCity:
            if migrationConditionList.count > 0 {
                picker.reloadAllComponents()
                showHiddenPicker(showPicker: true)
                return
            }
            else {
                loadData(reload: true)
                return
            }

        case btn_pickerConfirm:

            promt_condition.text = migrationConditionList[picker.selectedRow(inComponent: 0)].name
            conditonSelected = migrationConditionList[picker.selectedRow(inComponent: 0)]

            showBasicRights()

            showHiddenPicker(showPicker: false)
            return

        default:
            showHiddenPicker(showPicker: false)
            return
        }
    }
}
