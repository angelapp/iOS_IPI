//
//  PlanYourTripMenuViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 16/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class PlanYourTripMenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Outlets
    @IBOutlet weak var colletion_options: UICollectionView!

    // MARK: - Properties
    let itemsPerRow: CGFloat = 3

    var optionList: Array<PlanYourTripOptions> = []
    weak var maindelegate: MainProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        maindelegate = AplicationRuntime.sharedManager.mainDelegate

        colletion_options!.alwaysBounceVertical = true
        optionList = AplicationRuntime.sharedManager.getPlanTripOptions()

        self.colletion_options.dataSource = self
        self.colletion_options.delegate = self
    }

    //MARK: Collection view DataSource and FlowLayout Dategate
    // Set number of section in the colection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    //number of the items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return optionList.count
    }

    //fill collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.planYourTripOption.rawValue, for: indexPath) as! PlanYourTripOptionCollectionViewCell

        cell.img_option.image = UIImage(named: optionList[indexPath.row].icon)
        cell.tag = indexPath.row

        let selected = UITapGestureRecognizer(target: self, action: #selector(PlanYourTripMenuViewController.selected(gestureRecognizer:)))
        cell.addGestureRecognizer(selected)

        return cell
    }

    //Set Width and Heigth of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace: CGFloat = 30
        let availableWidth = colletion_options.bounds.size.width - paddingSpace
        let cellwidth = availableWidth / itemsPerRow
        let cellheigth = cellwidth * 1.18

        return CGSize(width: cellwidth, height: cellheigth)
    }

    // MARK: -  Gestures
    //Método para ejecutar acción al seleccionar una fila
    @objc func selected(gestureRecognizer: UITapGestureRecognizer){

        //maindelegate?.showMessageInMain(withMessage: "Excuse us, option temporarily disabled")
        let btnTapped = gestureRecognizer.view!
        let tagID = btnTapped.tag

        AplicationRuntime.sharedManager.setCurrentOption(currentOption: colletion_options[tagID])
        AplicationRuntime.sharedManager.addToContainer(viewControllerID: .planYourTrip)
    }
}
