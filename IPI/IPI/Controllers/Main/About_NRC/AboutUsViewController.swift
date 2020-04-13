//
//  AboutUsViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 06/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, AboutNRCTabProtocol {

    // MARK: - Outlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var button_collection: UICollectionView!

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var img_logo: UIImageView!
    
    // MARK: - Properties
    private let tabs = getTabs(forViewID: .aboutUs)
    private let tab1Index: Int = 0
    private let tab2Index: Int = 1
    private let tab3Index: Int = 2

    var currentTab: Int = 0
    var tab1: AboutUsTab1ViewController!
    var tab2: AboutUsTab2ViewController!
    var tab3: AboutUsTab3ViewController!
    
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
        
//        // Add gesture for go back
//        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
//        edgePan.edges = .left
//
//        self.view.addGestureRecognizer(edgePan)
    }
    
    // MARK: - Action for Gestures
    // Acction for go back with a gesture
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .ended {
            self.mainDelegate?.addToContainer(viewControllerID: .selectActivies)
        }
    }

    // MARK: - Private Functions
    private func instanciateTabs() {
        tab1 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.aboutUs_tab1.rawValue) as? AboutUsTab1ViewController
        tab2 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.aboutUs_tab2.rawValue) as? AboutUsTab2ViewController
        tab3 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerID.aboutUs_tab3.rawValue) as? AboutUsTab3ViewController
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

//        let indexPath = IndexPath(row: currentTab, section: 0)
//        button_collection.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.right, animated: true)

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

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.aboutTabButtonsCell.rawValue, for: indexPath) as! TabButtonsCollectionViewCell

        cell.aboutNRCTabDelegate = self
        cell.titleButton = tabs[indexPath.row]
        cell.tab_button.tag = indexPath.row
        cell.tab_button.isSelected = indexPath.row == currentTab
        cell.underline.isHidden = !cell.tab_button.isSelected
        cell.setButtonTitle()

        return cell
    }
    
//    //Set Width and Heigth of the cell
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let paddingSpace: CGFloat = 0
//        let availableWidth = button_collection.bounds.size.width - paddingSpace
//        let cellwidth = availableWidth / tabs.count
//        let cellheigth: CGFloat = 40.0
//
//        return CGSize(width: cellwidth, height: cellheigth)
//    }
}
