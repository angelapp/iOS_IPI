//
//  SigninTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 1/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class SigninTableViewCell: UITableViewCell, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var btn_send: UIButton!
    @IBOutlet weak var btn_recovery: UIButton!

    // MARK: - Properties
    weak var signinDelegate: SigninViewControllerDelegate?

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

        //Set Values
        lbl_title.text = Labels.login_title

        tf_email.placeholder = Labels.hint_email
        tf_email.delegate = self
        tf_email.tag = 0

        tf_password.placeholder = Labels.hint_password
        tf_password.delegate = self
        tf_password.tag = 1
        
        setButtonTitle(button: btn_recovery, title: Buttons.forgot)
    }

    //MARK: Métodos para el control de eventos del teclado
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

    @IBAction func buttonAction(_ sender: UIButton) {
        switch  sender {

        case btn_send:

            guard Validations.isValidData(fromField: tf_email), Validations.isValidData(fromField: tf_password) else {
                signinDelegate?.sendMessage(withMessage: ErrorMessages.completeInformation)
                return
            }

            guard Validations.isValidEmail(email: tf_email.text!) else {
                signinDelegate?.sendMessage(withMessage: ErrorMessages.invalidEmail)
                return
            }

            /*
            if let usrlocal = AplicationRuntime.sharedManager.getUser() {
                guard tf_email.text?.lowercased() == usrlocal?.email.lowercased() else {
                    showErrorMessage(withMessage: ErrorStrings.invalidCredentials)
                    return
                }
            }
            */

            let userRequest = RegisterUserProfileModel()
            userRequest.email = tf_email.text
            userRequest.password = tf_password.text

            signinDelegate?.signinRequest(userToAuth: userRequest)
            break

        default:
            break
        }
    }
}
