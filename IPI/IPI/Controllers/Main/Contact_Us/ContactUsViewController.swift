//
//  ContactUsViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 07/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class ContactUsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ContactUsViewControllerDelegate {

    // MARK: - Outlets
    @IBOutlet var contact_tableView : UITableView!

    // MARK: - Properties
    weak var mainDelegate: MainProtocol?

    var messageTypeList: Array<ContactFormType> = []
    var messageTypeID: Int!
    var message: String = nullString

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get picker and mainDelegate form options from runtime
        //messageTypeList = AplicationRuntime.sharedManager.getContactFormTypeList()
        //mainDelegate = AplicationRuntime.sharedManager.mainDelegate

        //It's added observable to scroll view when the keyboard is shown / hidden
        NotificationCenter.default.removeObserver(Any.self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification , object: nil)

        // Add delegate and Data Source to itself
        self.contact_tableView.delegate = self
        self.contact_tableView.dataSource = self
        self.contact_tableView.isScrollEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action for Gestures
    //Observer for increment contentSize in the tableView
    @objc func keyboardWillShow(notification: NSNotification) {
        self.singin_tableView.isScrollEnabled = true
    }

    //Obeserver for move frame to origin when keyboard is hiden
    @objc func keyboardWillHide(notification: NSNotification) {
        singin_tableView.isScrollEnabled = false
    }

    /* Update until here */
    // MARK: - Private Functions
    private func addStyles() {

        // Add tap gesture to message type View
        let tapSpinner = UITapGestureRecognizer(target: self, action: #selector(self.tappedMessageType))
        cnt_messageType.addGestureRecognizer(tapSpinner)
    }

    // MARK: - Request
    private func prepareRequest() {

        guard messageTypeID != nil, !message.isEmpty else {
            self.showErrorMessage(withMessage: ErrorStrings.requiredData)
            return
        }

        guard tf_telephone.text != nil else {
            self.showErrorMessage(withMessage: ErrorStrings.requiredData)
            return
        }

        //Se agregan datos adiciones al mesage con el formato siguiente
        // Teléfono: #; Mensaje: str; Nombres: str;  Email: str.
        let user: UserSerializer = AplicationRuntime.sharedManager.getUser()
        let name = String(format: Strings.fullname_format, user.first_name, user.last_name)
        message = String(format: Formats.contactMessage, tf_telephone.text!, message, name, user.email)

        let form = ContactForm()
        form.detail = message
        form.message_type = messageTypeID
        form.user = AplicationRuntime.sharedManager.getUserID()

        sendRequest(contactForm: form)
    }

    private func sendRequest(contactForm: ContactForm) {

        let json = Mapper().toJSONString(contactForm, prettyPrint: true)
        let token = NetworkConfig.token + AplicationRuntime.sharedManager.getUserToken()

        var headers: [[String:String]] = []
        headers.append([NetworkConfig.headerName: NetworkConfig.headerAuthorization,
                        NetworkConfig.headerValue: token])

        Network.buildRequest(urlApi: NetworkPOST.CONTACT_FORM, json: json, extraHeaders: headers, method: .methodPOST, completion: { (response) in

            switch response {

            case .succeeded(let succeed, let message):
                if !succeed {
                    printDebugMessage(tag: message)
                    self.showErrorMessage(withMessage: message)
                }
                break

            case .error(let error):
                print(error.debugDescription)
                break

            case .succeededObject(let objReceiver):

                _ = Mapper<ContactForm>().map(JSON: objReceiver as! [String: Any])

                self.lbl_promtMesaggeType.text = Strings.texfiled_placeholder
                self.tf_telephone.text = nil
                self.tv_message.text = Strings.contact_messagePlaceholder
                self.tv_message.textColor = .lightGray

                self.mainDelegate?.showMessageInMain(withMessage: Strings.message_ok_contact)

                break

            default:
                break
            }
        })

    }


    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {

        switch sender {

        case btn_cancel:
            showHiddenPicker()
            break

        case btn_confrim:
            lbl_promtMesaggeType.text = messageTypeList[0].name
            messageTypeID = messageTypeList[0].id
            showHiddenPicker()
            break

        default:
            prepareRequest()
            break
        }
    }

}
