//
//  DocumentsBodyTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 24/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class DocumentsBodyTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var btn_share: UIButton!
    @IBOutlet weak var btn_download: UIButton!
    @IBOutlet weak var lbl_text: UILabel!

    //MARK: - Properties
    var mainDelegate: MainProtocol? = AplicationRuntime.sharedManager.mainDelegate
    var documentsDelegate: DocumentsViewControllerDelegate?
    var file: String! = nullString

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func config_buttons() {
        setButtonImages(button: btn_share, normal: IPI_IMAGES.btn_share, hover: IPI_IMAGES.btn_share_hover)
        setButtonImages(button: btn_download, normal: IPI_IMAGES.btn_download, hover: IPI_IMAGES.btn_download_hover)

        setAspectFitToButton(buttons: btn_share, btn_download)
    }

    @IBAction func actionButtons(_ sender: UIButton) {

        guard file != nil, file != nullString else {
            mainDelegate?.showMessageInMain(withMessage: "Lo lamentamos no se ha podido cargar el documento")
            return
        }

        switch sender {

        case btn_share:
            documentsDelegate.openShareDocument(file: file, action: .share)
            printDebugMessage(tag: "sharing...")
            break

        default:
            documentsDelegate.openShareDocument(file: file, action: .open)
            printDebugMessage(tag: "opennig...")
            break
        }
    }
}
