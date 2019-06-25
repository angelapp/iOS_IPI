//
//  DocumentsViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, DocumentsViewControllerDelegate {

    //MARK: - Outlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var col_tab_bar: UICollectionView!
    
    //MARK: - Properties
    private var tabs: Array<DocumentType> = []
    private let TAB_1 = 0
    private let TAB_2 = 1
    
    var currentTab: Int = 0
    var tab_formats: DocumentsFormatsViewController!
    var tab_legal: DocumentsLegalViewController!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load Data
        instanciateTabs()
        tabs = AplicationRuntime.sharedManager.getAppConfig()?.document_type_Array ?? []
        
        col_tab_bar.delegate = self
        col_tab_bar.dataSource = self
        
        //Auto Adjust Collection view
        if let flowLayout = col_tab_bar.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 300, height: 40)
        }
        
        updateTabs()
    }
    
    // MARK: - Private Functions
    private func instanciateTabs() {
        tab_formats = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.documentsFormats.rawValue) as? DocumentsFormatsViewController
        tab_legal = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.documentsLegal.rawValue) as? DocumentsLegalViewController
        
    }
    
    private func showTab(tab: UIViewController) {
        
        if container.subviews.count > 0 {
            let vc = self.children.last
            vc?.willMove(toParent: nil)
            vc?.view.removeFromSuperview()
            vc?.removeFromParent()
        }
        
        //Agrega el nuevo controlador como hijo
        addChild(tab)
        //Se ajusta el tamaño de nuevo vc al tamaño del contenedor
        tab.view.frame = CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height)
        //Se agrega la vista al contenedor
        container.addSubview(tab.view)
        //recarga el controlador
        tab.viewDidLoad()
        //Se notifica
        tab.didMove(toParent: self)
    }
    
    // MARK: - Document delegate
    func changeTabSelected(toPosition position: Int) {
        currentTab = position
        updateTabs()
        col_tab_bar.reloadData()
    }
    
    // MARK: - Actions
    func updateTabs() {
        
        let indexPath = IndexPath(row: currentTab, section: 0)
        col_tab_bar.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.right, animated: true)
        
        switch currentTab {
            
        case TAB_2:
            showTab(tab: tab_legal)
            break
            
        default:
            tab_formats.documentType = tabs[0].id
            showTab(tab: tab_formats)
            break
        }
        
    }
    
    // MARK: - Collection view DataSource and FlowLayout Dategate
    // Set number of section in the colection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //number of the items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    
    //fill collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.aboutTabButtonsCell.rawValue, for: indexPath) as! TabButtonsCollectionViewCell
        
        cell.documentsTabDelegate = self
        cell.titleButton = tabs[indexPath.row].name
        cell.tab_button.tag = indexPath.row
        cell.tab_button.isSelected = indexPath.row == currentTab
        cell.underline.isHidden = !cell.tab_button.isSelected
        cell.setButtonTitle()
        
        return cell
    }
}
