//
//  SelectCountriesViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 14/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//
import UIKit
import ObjectMapper

class SelectCountriesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Outlets

    // Buttons
    @IBOutlet weak var btn_pickerCancel: UIButton!
    @IBOutlet weak var btn_nationality: UIButton!
    @IBOutlet weak var btn_destination: UIButton!
    @IBOutlet weak var btn_pickerConfirm: UIButton!

    // Conteiners
    @IBOutlet weak var cnt_pickers: UIView!

    // labels
    @IBOutlet weak var label_nationality: UILabel!
    @IBOutlet weak var label_destination: UILabel!
    @IBOutlet weak var promt_nationality: UILabel!
    @IBOutlet weak var promt_destination: UILabel!

    // Pickers
    @IBOutlet weak var picker: UIPickerView!

    // Spinner -- selector
    @IBOutlet weak var selector_nationatily: UIView!
    @IBOutlet weak var selector_destination: UIView!

    // MARK: - propeties

    // tags for load data into picker
    private let nationality: Int = 0
    private let destination: Int = 1

    weak var mainDelegate: MainProtocol?

    // List for spinners
    var nationalitiesList: Array<Country> = []
    var destinationsList: Array<Country> = []

    // Variables for items selected
    var nationalityID: Int!
    var destinationID: Int!

     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        
        cnt_pickers.isHidden = true
        picker.delegate = self
        picker.dataSource = self
        
        // Add gesture for go back
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
    }
    
    // Acction for go back with a gesture
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .ended {
            mainDelegate?.addToContainer(viewControllerID: .selectActivies)
        }
    }

    // Private functions
    private func loadData() {

        //Set Text to view
        label_nationality.text = Labels.select_your_nationality
        label_destination.text = Labels.select_your_destination
        promt_nationality.text = Labels.hint_spinner
        promt_destination.text = Labels.hint_spinner

        //Load data from app runtime
        nationalitiesList = AplicationRuntime.sharedManager.getCountries()
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        
        //Set background
        self.view.backgroundColor = Colors().getColor(from: ConseColors.background_blue.rawValue)
    }

     /// Hidden picker view
    private func showHiddenPicker(showPicker: Bool) {
        picker.isHidden = !showPicker
        cnt_pickers.isHidden =  !showPicker
    }
    
    private func showPlan() {
        mainDelegate?.addToContainer(viewControllerID: .planYourTripMenu)
    }

     /// Prepare request
     private func prepareRequest() {

         // Check if data is completed and correct
         guard nationalityID != nil, destinationID != nil, nationalityID != destinationID else { return }
        
         sendRequest(from: String(nationalityID), to: String(destinationID))
     }

     /// Set get Request
    func sendRequest(from nationality: String, to destination: String) {
        let loader = LoadingOverlay(text: LoaderStrings.configApp)
        let headers: [[String:String]] = []

        let urlApi = NetworkGET.DESTINATION_COUNTRY_INFO + destination +
                     NetworkGET.COUNTRY_INFO_ORIGIN_COUNTRY_APPEND + nationality

        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false

        Network.buildRequest(urlApi: urlApi, json: nullString, extraHeaders: headers, method: .methodGET, completion: {(response) in

            loader.hideOverlayView()
            self.view.isUserInteractionEnabled = true

            switch response {

            case .succeeded(let succeed, let message):
                if !succeed, !message.isEmpty {
                    print(message)
                }
                self.showPlan()
                break

            case .error(let error):
                print(error.debugDescription)
                break

            case .succeededObject(let objReceiver):

                let planModel = Mapper<PlanYourTripModel>().map(JSON: objReceiver as! [String: Any])
                
                planModel?.natCountryID = self.nationalityID
                planModel?.desCountryID = self.destinationID

                // Save configuration data in Local and set to runtime
                AplicationRuntime.sharedManager.setPlanTrip(plan: planModel)

                self.showPlan()
                break

            default:
                break
            }
        })
    }
    
    // MARK: - UIPickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
            
        case nationality:
            return nationalitiesList.count
            
        case destination:
            return destinationsList.count
            
        default:
            return 0
        }
    }
    
    // Set font to the label and set content
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //custom label
        let pickerLabel = UILabel()
        pickerLabel.numberOfLines = 0
        pickerLabel.sizeToFit()
        pickerLabel.textColor = UIColor.black
        pickerLabel.textAlignment = NSTextAlignment.center
        
        switch pickerView.tag {
            
            case nationality:
                pickerLabel.text = nationalitiesList[row].name
                break
            
            case destination:
                pickerLabel.text = destinationsList[row].name
                break
            
            default:
                break
        }
        
        return pickerLabel
    }
    
    //action for event onchange
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
            
            case nationality:
                promt_nationality.text = nationalitiesList[row].name
                nationalityID = nationalitiesList[row].id
            break
            
            case destination:
                promt_destination.text = destinationsList[row].name
                destinationID = destinationsList[row].id
                break
            
            default:
                break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }
    
    // MARK: - Action buttons
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
            case btn_nationality:
                picker.tag = nationality
                
                picker.reloadAllComponents()
                picker.selectRow(0, inComponent: 0, animated: false)
                showHiddenPicker(showPicker: true)
                return
            
            case btn_destination:
                
                guard nationalityID != nil else {
                    mainDelegate?.showMessageInMain(withMessage: ErrorMessages.completeInformation)
                    return
                }
                
                picker.tag = destination
                destinationsList = AplicationRuntime.sharedManager.getCountries(fromCountry: nationalityID)
                
                picker.reloadAllComponents()
                picker.selectRow(0, inComponent: 0, animated: false)
                showHiddenPicker(showPicker: true)
                
                return

            case btn_pickerConfirm:
                
                if picker.tag == nationality {
                    promt_nationality.text = nationalitiesList[picker.selectedRow(inComponent: 0)].name
                    nationalityID = nationalitiesList[picker.selectedRow(inComponent: 0)].id
                }
                else {
                    promt_destination.text = destinationsList[picker.selectedRow(inComponent: 0)].name
                    destinationID = destinationsList[picker.selectedRow(inComponent: 0)].id
                    
                    prepareRequest()
                }
                
                showHiddenPicker(showPicker: false)
                return

            default:
                showHiddenPicker(showPicker: false)
                return
        }
    }
}
