//
//  AboutNRC2TableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

/** Celda para ajustar los campos del TAB_2 (QUE HACEMOS) */
class AboutNRC2TableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var lbl_text_1: UILabel!
    @IBOutlet weak var lbl_text_2: UILabel!
    @IBOutlet weak var lbl_text_3: UILabel!
    @IBOutlet weak var lbl_text_4: UILabel!
    
    @IBOutlet weak var lbl_facebook: UILabel!
    @IBOutlet weak var lbl_twitter: UILabel!
    @IBOutlet weak var lbl_webPage: UILabel!
    
    @IBOutlet weak var img_assistance: UIImageView!
    @IBOutlet weak var img_education: UIImageView!
    @IBOutlet weak var img_housing: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Open browser in a tapped link
    @objc func tapLink(sender: UITapGestureRecognizer) {
        
        let linkTapped = sender.view!
        let tagID = linkTapped.tag
        
        var stringURL = nullString
        switch tagID {
            
        case AboutNRC.LinkID.facebook.rawValue:
            stringURL = AboutNRC.Social.href_facebook
            break
            
        case AboutNRC.LinkID.twitter.rawValue:
            stringURL = AboutNRC.Social.href_twitter
            break
            
        default:
            stringURL = AboutNRC.Social.href_webpage
            break
        }
        
        let webURL = stringURL.contains(Strings.hasHTTPProtocol) ? stringURL : Strings.httpProtocol + stringURL
        
        if let url = URL(string: webURL), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            }
            else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func fillCell() {
        
        // What do we do?
        lbl_text_1.attributedText = addBoldWord(forText: AboutNRC.Page_02.text_1, toWord: AboutNRC.Page_02.inBold_1, fontSize: lbl_text_1.font.pointSize)
        img_education.image = UIImage(named: AboutNRC.Images.photo_education)
        
        lbl_text_2.attributedText = addBoldWord(forText: AboutNRC.Page_02.text_2, toWord: AboutNRC.Page_02.inBold_2, fontSize: lbl_text_2.font.pointSize)
        img_assistance.image = UIImage(named: AboutNRC.Images.photo_assistance)
        
        lbl_text_3.attributedText = addBoldWord(forText: AboutNRC.Page_02.text_3, toWord: AboutNRC.Page_02.inBold_3, fontSize: lbl_text_3.font.pointSize)
        img_housing.image = UIImage(named: AboutNRC.Images.photo_housing)
        
        lbl_text_4.text = AboutNRC.Page_02.text_4
        
        // Social
        lbl_facebook.attributedText = addLinkStyle(forText: AboutNRC.Social.copy_facebook)
        lbl_facebook.tag = AboutNRC.LinkID.facebook.rawValue
        
        lbl_twitter.attributedText = addLinkStyle(forText: AboutNRC.Social.copy_twitter)
        lbl_twitter.tag =  AboutNRC.LinkID.twitter.rawValue
        
        lbl_webPage.attributedText = addLinkStyle(forText: AboutNRC.Social.copy_webpage)
        lbl_webPage.tag =  AboutNRC.LinkID.webpage.rawValue
        
        // Gesture for link
        let tapLinkFB = UITapGestureRecognizer(target: self, action: #selector(self.tapLink))
        lbl_facebook.isUserInteractionEnabled = true
        lbl_facebook.addGestureRecognizer(tapLinkFB)
        
        let tapLinkTW = UITapGestureRecognizer(target: self, action: #selector(self.tapLink))
        lbl_twitter.isUserInteractionEnabled = true
        lbl_twitter.addGestureRecognizer(tapLinkTW)
        
        let tapWeb = UITapGestureRecognizer(target: self, action: #selector(self.tapLink))
        lbl_webPage.isUserInteractionEnabled = true
        lbl_webPage.addGestureRecognizer(tapWeb)
    }
}
