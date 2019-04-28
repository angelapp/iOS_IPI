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
        lblText.text = onbortingText
        lblTitle.text = onbortingTitle
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
