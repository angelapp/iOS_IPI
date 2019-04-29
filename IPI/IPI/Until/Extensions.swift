//
//  Extensions.swift
//  IPI
//
//  Created by Felipe Zamudio on 28/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Extensions
extension UIViewController {
    
    //Action of the returnKey in texField
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
    
    //Method for dismis keyboard when tapp around
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Hide Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /// Show Alert with message
    func showErrorMessage(withMessage msn:String, title:String? = nullString) {
        
        let alert = UIAlertController(title: title, message: msn, preferredStyle: .alert)
        let cancel = UIAlertAction(title: Buttons.accept, style: .cancel) {(_) in
            alert.dismiss(animated: false, completion: nil)
        }
        
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
