//
//  SignupTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 28/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignupTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password1: UITextField!
    @IBOutlet weak var tf_password2: UITextField!
    @IBOutlet weak var btn_accept: UIButton!
    @IBOutlet weak var btn_facebook: UIButton!
    @IBOutlet weak var btn_google: UIButton!
    
    //MARK: - Properties
    weak var signupDelegate: SignupViewControllerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Add the labels to objects and set objects configuration
    func fillCell() {
        
        //Set Values
        lbl_title.text = Labels.create_account
        
        tf_email.placeholder = Labels.hint_email
        tf_email.delegate = self
        tf_email.tag = 0
        
        tf_password1.placeholder = Labels.hint_new_password
        tf_password1.delegate = self
        tf_password1.tag = 1
        
        tf_password2.placeholder = Labels.hint_confirm_pwssd
        tf_password2.delegate = self
        tf_password2.tag = 2
        
        // Config buttons
        setButtonTitle(button: btn_accept, title: Buttons.ready)
        setButtonTitle(button: btn_facebook, title: Buttons.facebook)
        setButtonTitle(button: btn_google, title: Buttons.google)
        
        btn_facebook.setBackgroundColor(color: Colors().getColor(from: ConseColors.button_facebook.rawValue), forState: .normal)
        btn_facebook.setBackgroundColor(color: Colors().getColor(from: ConseColors.button_facebook_hover.rawValue), forState: .highlighted)
        
        btn_google.setBackgroundColor(color: Colors().getColor(from: ConseColors.button_google_hover.rawValue), forState: .highlighted)
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
            
        case btn_facebook:
            signupDelegate?.facebookSignup()
            break
            
        case btn_google:
            signupDelegate?.googleSignup()
            break
            
        default:
            guard Validations.isValidData(fromField: tf_email), Validations.isValidData(fromField: tf_password1), Validations.isValidData(fromField: tf_password2) else {
                signupDelegate?.sendMessage(withMessage: ErrorMessages.completeInformation)
                return
            }
            
            guard Validations.isValidEmail(email: tf_email.text!) else {
                signupDelegate?.sendMessage(withMessage: ErrorMessages.invalidEmail)
                return
            }
            
            // Se validan las contraseñas
            guard  tf_password1.text! == tf_password2.text else {
                signupDelegate?.sendMessage(withMessage: ErrorMessages.pswNotMatch)
                return
            }
            
            let userRequest = RegisterUserProfileModel()
            userRequest.email = tf_email.text
            userRequest.password = tf_password1.text
            
            signupDelegate?.signupRequest(userToRegister: userRequest)
            break
        }
        
    }
}
