//
//  CountryDataViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 16/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class CountryDataViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CountryDataViewControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var button_collection: UICollectionView!

    // MARK: - Properties
    private let tabs = getTabs(forViewID: .countryData)
    private let tab1Index: Int = 0
    private let tab2Index: Int = 1
    private let tab3Index: Int = 2
    
    var currentTab: Int = 0
    var tab1: GeneralDataViewController!
    var tab2: WeatherDataViewController!
    var tab3: TransportDataViewController!
    
    weak var mainDelegate = AplicationRuntime.sharedManager.mainDelegate
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //load data
        instanciateTabs()
        
        button_collection.delegate = self
        button_collection.dataSource = self
        
        //Auto Adjust Collection view
        if let flowLayout = button_collection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 125, height: 40)
        }
        
        //Check that exist Data
        guard tabs.count > 0 else {
            mainDelegate?.showMessageInMain(withMessage: ErrorMessages.dataNotFound)
            //            mainDelegate?.addToContainer(viewControllerID: .planYourTripMenu)
            return
        }
        
        changeTab()
        button_collection.reloadData()
    }
    
    // MARK: - Private Functions
    private func instanciateTabs() {
        tab1 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.generalData.rawValue) as? GeneralDataViewController
        tab2 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.weatherData.rawValue) as? WeatherDataViewController
        tab3 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.transportData.rawValue) as? TransportDataViewController
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
    
    // MARK: - Actions
    func changeTab() {
        
        switch currentTab {
            
        case tab2Index:
            showTab(tab: tab2)
            break
            
        case tab3Index:
            showTab(tab: tab3)
            break
            
        default:showTab(tab: tab1)
            break
        }
    }
    
    // MARK: Country Data Delegate
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.aboutTabButtonsCell.rawValue, for: indexPath) as! TabButtonsCollectionViewCell
        
        cell.countryDataTabDelegate = self
        cell.titleButton = tabs[indexPath.row]
        cell.tab_button.tag = indexPath.row
        cell.tab_button.titleLabel?.textAlignment = .center
        cell.tab_button.isSelected = indexPath.row == currentTab
        cell.underline.isHidden = !cell.tab_button.isSelected
        cell.setButtonTitle()
        
        return cell
    }

}
