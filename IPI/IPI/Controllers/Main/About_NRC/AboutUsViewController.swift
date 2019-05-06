//
//  AboutUsViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 12/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, AboutNRCTabProtocol {

    // MARK: - Outlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var button_collection: UICollectionView!
    
    @IBOutlet weak var lbl_title: UILabel!
    
    // MARK: - Properties
    private let tabs = getTabs(forViewID: .aboutUs)
    private let tab1Index: Int = 0
    private let tab2Index: Int = 1
    private let tab3Index: Int = 2
    
    var currentTab: Int = 0
    var tab1: AboutUsTab1ViewController!
    var tab2: AboutUsTab2ViewController!
    var tab3: AboutUsTab3ViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instanciateTabs()
        
        currentTab = tab1Index
        changeTab()
        
        button_collection.delegate = self
        button_collection.dataSource = self
        
        if let flowLayout = button_collection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 150, height: 40)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func instanciateTabs() {
        tab1 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs_tab1) as! AboutUsTab1ViewController
        tab2 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs_tab2) as! AboutUsTab2ViewController
        tab3 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs_tab3) as! AboutUsTab3ViewController
    }
    
    private func showTab(tab: UIViewController) {
        
        if container.subviews.count > 0 {
            let vc = self.childViewControllers.last
            vc?.willMove(toParentViewController: nil)
            vc?.view.removeFromSuperview()
            vc?.removeFromParentViewController()
        }
        
        //Agrega el nuevo controlador como hijo
        addChildViewController(tab)
        //Se ajusta el tamaño de nuevo vc al tamaño del contenedor
        tab.view.frame = CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height)
        //Se agrega la vista al contenedor
        container.addSubview(tab.view)
        //recarga el controlador
        tab.viewDidLoad()
        //Se notifica
        tab.didMove(toParentViewController: self)
    }
    
    // MARK: - Actions
    func changeTab() {
        
        let indexPath = IndexPath(row: currentTab, section: 0)
        button_collection.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.right, animated: true)
        
        switch currentTab {
            
        case tab1Index:
            showTab(tab: tab1)
            break
            
        case tab2Index:
            showTab(tab: tab2)
            break
            
        default:showTab(tab: tab3)
            break
        }
    }

    // MARK: - Public Functions (Access by protocols)
    func changeTabSelected(toPosition position: Int) {
        currentTab = position
        button_collection.reloadData()
        changeTab()
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.aboutNRCTabs, for: indexPath) as! TabButtonsCollectionViewCell
        
        cell.aboutNRCTabDelegate = self
        cell.titleButton = tabs[indexPath.row]
        cell.tab_button.tag = indexPath.row
        cell.tab_button.isSelected = indexPath.row == currentTab
        cell.underline.isHidden = !cell.tab_button.isSelected
        cell.setButtonTitle()
        
        return cell
    }
}
