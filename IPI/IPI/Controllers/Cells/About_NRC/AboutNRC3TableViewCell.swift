//
//  AboutNRC3TableViewswift
//  IPI
//
//  Created by Felipe Zamudio on 06/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

/** Celda para ajustar los campos del TAB_3 (DONDE TRABAJAMOS) */
class AboutNRC3TableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var img_map: UIImageView!

    @IBOutlet weak var lbl_facebook: UILabel!
    @IBOutlet weak var lbl_office: UILabel!
    @IBOutlet weak var lbl_twitter: UILabel!
    @IBOutlet weak var lbl_text_1: UILabel!
    @IBOutlet weak var lbl_webPage: UILabel!

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

        case AboutNRC.LinkID.office.rawValue:
            stringURL = AboutNRC.Page_03.href_2
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

        img_map.image = UIImage(named: AboutNRC.Images.photo_map)

        lbl_text_1.text = AboutNRC.Page_03.text_1

        lbl_office.attributedText = addLinkStyle(forText: AboutNRC.Page_03.text_2)
        lbl_office.tag = AboutNRC.LinkID.office.rawValue

        // Social
        lbl_facebook.attributedText = addLinkStyle(forText: AboutNRC.Social.copy_facebook)
        lbl_facebook.tag = AboutNRC.LinkID.facebook.rawValue

        lbl_twitter.attributedText = addLinkStyle(forText: AboutNRC.Social.copy_twitter)
        lbl_twitter.tag =  AboutNRC.LinkID.twitter.rawValue

        lbl_webPage.attributedText = addLinkStyle(forText: AboutNRC.Social.copy_webpage)
        lbl_webPage.tag =  AboutNRC.LinkID.webpage.rawValue

        // Gesture for link
        let tapLink = UITapGestureRecognizer(target: self, action: #selector(self.tapLink))
        lbl_office.isUserInteractionEnabled = true
        lbl_office.addGestureRecognizer(tapLink)

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
