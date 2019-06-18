//
//  PlanYourTripViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 16/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class PlanYourTripViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_speaker: UIButton!
    
    @IBOutlet weak var img_icon: UIImageView!
    @IBOutlet weak var lbl_title: UILabel!
    
    @IBOutlet weak var container: UIView!
    
    // MARK: - Properties
    var logView: [ViewControllerID]! = []
    
    // Controllers that are managed by this controller
    var basicRightsVC: BasicRightsViewController!
    var documentsVC: DocumentsViewController!
    var generalDataVC: GeneralDataViewController!
    var migrationRequirementsVC: MigrationRequirementsViewController!
    var nationalizationRequirementsVC: NationalizationRequirementsViewController!
    var phonebookVC: PhonebookViewController!
    var refugeRequestVC: RefugeRequestViewController!
    var visasVC: VisasViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
