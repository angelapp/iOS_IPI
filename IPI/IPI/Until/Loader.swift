//
//  Loader.swift
//  IPI
//
//  Created by Felipe Zamudio on 4/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation
import UIKit

public class LoadingOverlay {
    
    var overlayView : UIView!
    var message : String
    let messageLabel = UILabel()
    var activityIndicator : UIActivityIndicatorView!
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay(text: LoaderStrings.loading)
        }
        return Static.instance
    }
    
    init(text: String){
        self.message = text
        self.overlayView = UIView()
        self.activityIndicator = UIActivityIndicatorView()
        
        // "Background" loader
        overlayView.frame = CGRect(x: 0, y: 0, width: 240, height: 128)
        overlayView.backgroundColor = .white
        overlayView.layer.cornerRadius = 10
        
        // Indicator loader
        activityIndicator.frame = CGRect(x: 100, y: 16, width: 40, height: 40)
        activityIndicator.style = .gray
        activityIndicator.color = .darkGray
        
        // Text message
        messageLabel.frame = CGRect(x: 16, y: 64, width: 208, height: 48)
        messageLabel.textColor = .black
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.systemFont(ofSize: 13)
        messageLabel.textAlignment = .center
        
        overlayView.addSubview(activityIndicator)
        overlayView.addSubview(messageLabel)
    }
    
    //Show loader
    public func showOverlay(view: UIView) {
        overlayView.center = view.center
        view.addSubview(overlayView)
        activityIndicator.startAnimating()
    }
    
    //Hide loader
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
