//
//  RecoveryTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 1/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class RecoveryTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var btn_send: UIButton!
    @IBOutlet weak var btn_login: UIButton!
    
    // MARK: - Properties
    weak var recoveryDelegate: RecoveryViewControllerDelegate?
    
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
            
            guard Validations.isValidData(fromField: tf_email) else {
                recoveryDelegate?.sendMessage(withMessage: ErrorMessages.completeInformation)
                return
            }
            
            guard Validations.isValidEmail(email: tf_email.text!) else {
                recoveryDelegate?.sendMessage(withMessage: ErrorMessages.invalidEmail)
                return
            }
            
            let username = RegisterUserProfileModel()
            username.email = tf_email.text
            
            recoveryDelegate?.sendRecoveryPost(email: username)
            break
            
        default:
            recoveryDelegate?.dismiss()
            break
        }
        
    }
    
}
