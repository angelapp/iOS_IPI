//
//  OnBoardingContentViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class OnBoardingContentViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var ivImage: UIImageView!
    @IBOutlet var lblText: UILabel!
    @IBOutlet var lblTitle: UILabel!
    
    // MARK: - Properties
    var index = 0
    var imageName = ""
    var onbortingText = ""
    var onbortingTitle = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivImage.image = UIImage(named: imageName)
        lblTitle.text = onbortingTitle
        lblText.attributedText = addBoldWord(forText: onbortingText, toWord: ONBOARDING.PAGE_05.inBold, fontSize: lblText.font.pointSize)
    }
}
