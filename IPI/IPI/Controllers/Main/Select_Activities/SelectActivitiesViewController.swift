//
//  SelectActivitiesViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 14/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class SelectActivitiesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var btn_planYourTrip : UIButton!
    @IBOutlet var btn_basicConcepts : UIButton!
    
    @IBOutlet var img_ilustracion : UIImageView!
    
    // MARK: - Properties
    weak var mainDelegate: MainProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        self.view.backgroundColor = Colors().getColor(from: ConseColors.background_blue.rawValue)
        
        setButtonTitle(button: btn_planYourTrip, title: Buttons.plan_your_trip)
        setButtonTitle(button: btn_basicConcepts, title: Buttons.basic_Concepts)
        
        img_ilustracion.image = UIImage(named: IPI_IMAGES.selectActivitiesImage)
    }
    

    // MARK: Actions
    @IBAction func buttonActions (_ sender: UIButton) {
        
        switch sender {
            
        case btn_basicConcepts:
            mainDelegate?.addToContainer(viewControllerID: .course)
            break
            
        default:
            break
        }
    }

}
