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
    func showErrorMessage(withMessage msn:String, title:String? = nullString, closeVC:Bool? = false) {

        let alert = UIAlertController(title: title, message: msn, preferredStyle: .alert)
        let cancel = UIAlertAction(title: Buttons.accept, style: .cancel) {(_) in
            alert.dismiss(animated: false, completion: nil)

            // Closed parent viewController
            if closeVC ?? false {
                self.dismiss(animated: true, completion: nil)
            }
        }

        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

// Link action as tapGesture
// REVISAR
extension UITapGestureRecognizer {

    // http://samwize.com/2016/03/04/how-to-create-multiple-tappable-links-in-a-uilabel/
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {

        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)

        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)

        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                     y: locationOfTouchInLabel.y - textContainerOffset.y)

        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer,
                                                            in: textContainer,
                                                            fractionOfDistanceBetweenInsertionPoints: nil)

        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}

extension UIImage {

    // Combiana las imagenes de entrada para generar una única imagen
    class func combine(images: UIImage...) -> UIImage {
        var contextSize = CGSize.zero

        for image in images {
            contextSize.width = max(contextSize.width, image.size.width)
            contextSize.height = max(contextSize.height, image.size.height)
        }

        UIGraphicsBeginImageContextWithOptions(contextSize, false, UIScreen.main.scale)

        for image in images {
            let originX = (contextSize.width - image.size.width) / 2
            let originY = (contextSize.height - image.size.height) / 2

            image.draw(in: CGRect(x: originX, y: originY, width: image.size.width, height: image.size.height))
        }

        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return combinedImage!
    }
}