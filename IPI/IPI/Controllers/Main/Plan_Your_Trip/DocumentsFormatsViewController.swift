//
//  DocumentsFormatsViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 24/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class DocumentsFormatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {//, UIDocumentInteractionControllerDelegate, DocumentsFormatsControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var tbl_documents: UITableView!

    // MARK: - Properties
    var documentType: Int!
    var documents: Array<LibraryDocument> = []
    var documentsDelegate: DocumentsViewControllerDelegate?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        documents = AplicationRuntime.sharedManager.getDocuments(fromType: documentType)

        tbl_documents.delegate = self
        tbl_documents.dataSource = self
    }

    // MARK: - TableView delegate and datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }

    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }

    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue) as! DocumentsBodyTableViewCell

        //Look the URL file
        var fileURL = nullString
        if documents[indexPath.row].file != nil {
            fileURL = documents[indexPath.row].file
        }
        else if documents[indexPath.row].url != nil {
            fileURL = documents[indexPath.row].url
        }

        cell.lbl_text.text = documents[indexPath.row].name
        cell.file = fileURL
        cell.documentsFormatDelegate = self.documentsDelegate
        cell.config_buttons()

        return cell
    }

//    // MARK: - Documents Delegate
//    func openShareDocument(file: String!, action: FileActions) {
//
//        if action == .open {
//
//            let sb = UIStoryboard(name: StoryboardID.Popup.rawValue, bundle: nil)
//            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllerID.openFileVC.rawValue) as! OpenFilePopupViewController
//
//            nextVC.strURL = file
//            nextVC.modalPresentationStyle = .overCurrentContext
//            nextVC.modalTransitionStyle = .crossDissolve
//            present(nextVC, animated: true, completion: nil)
//        }
//
//        if action == .share {
//            let objectsToShare = [file] as [Any]
//            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//            activityVC.setValue(nullString, forKey: subject)
//
//            self.present(activityVC, animated: true, completion: nil)
//        }
//    }
//
//    // MARK:  - UIDocumentInteractionController delegates
//    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
//        return self
//    }
}