//
//  OpenFilePopupViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 24/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class OpenFilePopupViewController: UIViewController, UIWebViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var wkView: UIWebView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    // MARK: - Properties
    var strURL: String! = nullString
    var fileName: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wkView.delegate? = self
        navBar.topItem?.title = fileName
        
        openFile()
    }

    // MARK: - Functions
    func openFile(){
        
        if let fileURL = URL(string: strURL) {
            wkView.loadRequest(URLRequest(url: fileURL))
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Actions
    @IBAction func acctionButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func acction(_ sender: UIBarButtonItem) {
        guard strURL != nullString else { return }
        let objectsToShare = [strURL] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
}
