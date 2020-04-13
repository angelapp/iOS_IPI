//
//  PhonebookSelectCityViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 28/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class PhonebookSelectCityViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    var cityList: Array<City>!
    var citySelected: City!
    var plantripDelegate: PlanYourTripViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load City list
        if cityList == nil { loadData() }
        
        // Load Country Name
        var country = nullString
        if let id = AplicationRuntime.sharedManager.getPlanTrip()?.desCountryID {
            country = AplicationRuntime.sharedManager.getCountry(fromID: id, getName: true)
        }

        // Fill Labels
        lbl_Message.text = String(format: Formats.selectCityFormat, country)
        promt_city.text = Labels.hint_spinner
        
        // Config pickers
        cnt_picker.isHidden = true
        picker.delegate = self
        picker.dataSource = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        cityList = []
        picker.reloadAllComponents()
    }
    
    private func loadData(reload: Bool? = false) {
        cityList = AplicationRuntime.sharedManager.getCities()
        picker.reloadAllComponents()
        
        if reload ?? false { actionButtons(btn_selectCity) }
    }
    
    /// Hidden picker view
    private func showHiddenPicker(showPicker: Bool) {
        picker.isHidden = !showPicker
        cnt_picker.isHidden =  !showPicker
    }
    
    private func showPhonebook() {
        plantripDelegate?.showPhonebook(forCity: citySelected)
    }
    
    // MARK: - UIPickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityList.count
    }
    
    // Set font to the label and set content
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //custom label
        let pickerLabel = UILabel()
        pickerLabel.numberOfLines = 0
        pickerLabel.sizeToFit()
        pickerLabel.textColor = UIColor.black
        pickerLabel.textAlignment = NSTextAlignment.center
        
        pickerLabel.text = cityList[row].name
        
        return pickerLabel
    }
    
    //action for event onchange
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        promt_city.text = cityList[row].name
        citySelected = cityList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }
    
    // MARK: - Action buttons
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_selectCity:
            if cityList.count > 0 {
                picker.reloadAllComponents()
                showHiddenPicker(showPicker: true)
                return
            }
            else {
                loadData(reload: true)
                return
            }
            
            
        case btn_pickerConfirm:
            
            promt_city.text = cityList[picker.selectedRow(inComponent: 0)].name
            citySelected = cityList[picker.selectedRow(inComponent: 0)]
            
            showPhonebook()
            
            showHiddenPicker(showPicker: false)
            return
            
        default:
            showHiddenPicker(showPicker: false)
            return
        }
    }
}
