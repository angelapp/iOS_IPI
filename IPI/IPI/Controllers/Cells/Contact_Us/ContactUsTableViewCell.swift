//
//  ContactUsTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 1/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class ContactUsTableViewCell: UITableViewCell, UITextViewDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Outlets

    // Picker Buttons
    @IBOutlet weak var btn_cancel: UIButton!
    @IBOutlet weak var btn_confrim: UIButton!
    @IBOutlet weak var btn_send: UIButton!

    @IBOutlet weak var cnt_messageType: UIView!
    @IBOutlet weak var cnt_picker: UIView!

    @IBOutlet weak var lbl_messageType: UILabel!
    @IBOutlet weak var lbl_message: UILabel!
    @IBOutlet weak var lbl_telephone: UILabel!
    @IBOutlet weak var lbl_promtMesaggeType: UILabel!
    @IBOutlet weak var lbl_title: UILabel!

    @IBOutlet weak var picker: UIPickerView!

    @IBOutlet weak var tf_telephone: UITextField!
    @IBOutlet weak var tv_message: UITextView!

    // MARK: - Properties
    weak var contactDelegate: ContactUsViewControllerDelegate?

    var messageTypeList: Array<ContactFormType> = []
    var messageTypeID: Int!
    var message: String = nullString

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Cell Functions

    /// Add the labels to objects and set objects configuration
    func fillCell() {

        picker.delegate = self
        picker.dataSource = self
        tv_message.delegate = self
        tf_telephone.delegate = self
        
        setButtonTitle(button: btn_send, title: Buttons.send)

        //Set Values
        lbl_message.text = Labels.contact_messageTitle
        lbl_messageType.text = Labels.contact_kindOfMessage
        lbl_promtMesaggeType.text = Labels.hint_kindofMessage
        lbl_telephone.text = Labels.contact_telephone
        lbl_title.text = Labels.contact_title

        tf_telephone.placeholder = Labels.contact_telephone

        // Hidden content Picker
        cnt_picker.isHidden = true

        //Set placeholder to textView if message is Empty
        if message == nullString {
            tv_message.text = Labels.hint_contact_message
            tv_message.textColor = .lightGray
        }
        else {
            tv_message.text = message
            tv_message.textColor = .black
        }

        // Add tap gesture to message type View
        let tapSpinner = UITapGestureRecognizer(target: self, action: #selector(self.tappedMessageType))
        cnt_messageType.addGestureRecognizer(tapSpinner)

        addDoneButtonOnKeyboard()
    }

    private func showHiddenPicker() {
        cnt_picker.isHidden = !cnt_picker.isHidden
    }

    private func prepareRequest() {
        // Check if there is information to send
        guard messageTypeID != nil, !message.isEmpty, message != nullString,
              tf_telephone.text != nil, tf_telephone.text != nullString else {
                  contactDelegate?.sendMessage(withMessage: ErrorMessages.completeInformation)
                  return
        }

        //Add form information in message with the next format
        //Email: str, Teléfono: str; Mensaje: str.
        let user: UserSerializer = AplicationRuntime.sharedManager.getUser()
        message = String(format: Formats.contactMessage, user.email, tf_telephone.text!, message)

        //Create Model for send
        let form = ContactForm()

        form.detail = message
        form.message_type = messageTypeID
        form.user = AplicationRuntime.sharedManager.getUserID()

        // send request
        contactDelegate?.sendRequest(contactForm: form)
    }

    //MARK: Métodos para el control de eventos del teclado
    /// Se agrega boton de retorno o confirmacion al teclado numerico
    /** REVISAR **/
    func addDoneButtonOnKeyboard() {
        let doneToolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: self.bounds.size.width, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        doneToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: Buttons.accept, style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneButtonAction))
        ]

        doneToolbar.sizeToFit()

        self.tf_telephone.inputAccessoryView = doneToolbar
    }

    /// Se agrega el funcionalidad de *Return* a la barra del teclado
    @objc func doneButtonAction() -> Bool {
        return self.textFieldShouldReturn(tf_telephone)
    }

    //Action of the returnKey
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        return false
    }

    // MARK: - TextView Delegate
    // Delete placeholder when start editing
    func textViewDidBeginEditing(_ textView: UITextView) {

        if textView.text == Labels.hint_contact_message {
            textView.text = nullString
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }

    // Se placeholder when end editing, and text is empty
    func textViewDidEndEditing(_ textView: UITextView) {

        //If text is empty, put Placeholder
        if textView.text == nullString {
            textView.text = Labels.hint_contact_message
            textView.textColor = .lightGray
        }

        //If text is diferent to placeholder, set text to message
        if textView.text != Labels.hint_contact_message {
            message = textView.text!
        }

        textView.resignFirstResponder()
    }

    // TextView resing keyboard
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == jumpLine {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    //MARK: - UIPicker DataSource and Delegate
    // Set number of columms section for the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // Set number of componets for genderPicker and localityPicker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return messageTypeList.count
    }

    // Set font to the label and set content
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        //custom label
        let pickerLabel = UILabel()
        pickerLabel.numberOfLines = 0
        pickerLabel.sizeToFit()
        pickerLabel.textColor = UIColor.black
        pickerLabel.textAlignment = NSTextAlignment.center
        pickerLabel.text = messageTypeList[row].name

        return pickerLabel
    }

    //action for event onchange
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lbl_promtMesaggeType.text = messageTypeList[row].name
        messageTypeID = messageTypeList[row].id
        cnt_picker.isHidden = true
    }

    // MARK: - Gestures
    @objc func tappedMessageType (gestureRecognizer: UITapGestureRecognizer){
        showHiddenPicker()
    }

    // MARK: Buttons Actions
    @IBAction func buttonAction(_ sender: UIButton) {
        switch  sender {

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
