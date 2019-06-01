//
//  CourseMessagesViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 19/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class CourseMessagesViewController: UIViewController {
    
    // MARK: - Outltes
    @IBOutlet weak var btn_tryNext: UIButton!
    @IBOutlet weak var img_icon: UIImageView!
    @IBOutlet weak var lbl_message: UILabel!
    
    // MARK: - Properties
    weak var courseDelegate: CourseViewControllerDelegate?
    
    var poupMessage: PopupMessage = .failed
    var message: String = nullString
    var inBold: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        fillView()
    }
    
    // MARK: - Private Function
    private func fillView() {
        
        // Set image and buttons title
        if poupMessage == .failed {
            setButtonTitle(button: btn_tryNext, title: Buttons.try_again)
            img_icon.image = UIImage(named: IPI_IMAGES.fail)
        }
        else {
            setButtonTitle(button: btn_tryNext, title: Buttons.next)
            img_icon.image = UIImage(named: IPI_IMAGES.success)
        }
        
        // load message and his attibutes
        if inBold != nil && !(inBold?.isEmpty)! {
            lbl_message.attributedText = addBoldWord(forText: message, toWord: inBold!, fontSize: lbl_message.font.pointSize)
        }
        else {
            lbl_message.text = message
        }
    }
    
    // MARK: - Navigation
    @IBAction func dissmisMessage(_ sender: UIButton) {
        
        if poupMessage == .success {
            courseDelegate?.nextPage()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
