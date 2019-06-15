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
    var destinationspList: Array<Country> = []

    // Variables for items selected
    var nationalityID: Int!
    var destinationID: Int!

     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()

    }

    // Private functions
    private func loadData() {

        //Set Text to view
        label_nationality.text = Labels.select_your_nationality
        label_destination.text = Labels.select_your_destination
        promt_nationality.text = Labels.hint_spinner
        promt_destination.text = Labels.hint_spinner

        //Disable Buttons
        

        //Load nationality data
         nationalitiesList = AplicationRuntime.sharedManager.getCountries()
    }

     /// Hidden picker view
    private func showHiddenPicker(showPicker: Bool) {
        picker.isHidden = !showPicker
        cnt_pickers.isHidden =  !showPicker
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
//                self.startCose()
                break

            case .error(let error):
                print(error.debugDescription)
                break

            case .succeededObject(let objReceiver):

                let config = Mapper<ApplicationConfiguration>().map(JSON: objReceiver as! [String: Any])

                // Save configuration data in Local and set to runtime
//                AplicationRuntime.sharedManager.setAppConfig(config: config!)
//                StorageFunctions.saveAppConfigInLocal(config: config!)

//                self.startCose()
                break

            default:
                break
            }
        })
    }
    
    // MARK: - UIPickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
}
