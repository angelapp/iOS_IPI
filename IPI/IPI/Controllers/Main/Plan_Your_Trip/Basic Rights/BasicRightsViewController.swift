//
//  BasicRightsViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/06/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit

class BasicRightsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, BasicRightsViewControllerDelegate {

	// MARK: - Outlets
    @IBOutlet weak var lbl_msn: UILabel!
    @IBOutlet weak var tbl_basicRights: UITableView!
    @IBOutlet weak var button_collection: UICollectionView!

    // MARK: - Properties
    private let tab1Index: Int = 0
    private let tab2Index: Int = 1

	var currentTab: Int = 0

	//
	var migrationCondition: MigrationConditionType!
	var migrationTypeList: Array<DocumentConditionType> = []
    var basicRightsList: Array<BasicRight> = []

	// Expandable
	var expandedSections : NSMutableSet = []

    weak var mainDelegate = AplicationRuntime.sharedManager.mainDelegate

    // MARK: - Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()

        //load data
		if migrationTypeList.count == 0 {
            loadData()
		}

		// Set data sourse and delegate to tableview
        tbl_basicRights.delegate = self
        tbl_basicRights.dataSource = self

		// Set data sourse and delegate to Collection View
        button_collection.delegate = self
        button_collection.dataSource = self

        //Auto Adjust Collection view
        if let flowLayout = button_collection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 125, height: 40)
        }

        changeTab()
		tbl_basicRights.reloadData()
        button_collection.reloadData()
    }

    // Clean Al properties when the controller its removed
    override func viewDidDisappear(_ animated: Bool) {
        migrationCondition = nil
        migrationTypeList = []
        basicRightsList = []
        lbl_msn.text = nullString
        currentTab = 0
        tbl_basicRights.reloadData()
    }

	private func loadData(){
		migrationTypeList = migrationCondition.document_condition_list
        basicRightsList = migrationTypeList[currentTab].basic_right_list

        lbl_msn.text = migrationCondition.name
	}

    func changeTab() {
        //Clean List
        basicRightsList = []
        //Set data for new selected
        basicRightsList = migrationTypeList[currentTab].basic_right_list
        //Update view
        tbl_basicRights.reloadData()
    }

	// MARK: Basic Rights Delegate
    func changeTabSelected(toPosition position: Int) {
        currentTab = position
        changeTab()
        button_collection.reloadData()
    }

	// MARK: - Expandable tableview functions
    //Determina la sección de la tabla que fue seleccionada para mostrar el contenido
    @objc func tapSection(sender: UITapGestureRecognizer) {

        let sectionTapped = sender.view!
        let section = sectionTapped.tag

        let shouldExpand = !expandedSections.contains(section)
        var indexPath: IndexPath!

        if (shouldExpand) {
            expandedSections.removeAllObjects()
            expandedSections.add(section)
            indexPath = IndexPath(row: 0, section: section)
        } else {
            expandedSections.removeAllObjects()
            indexPath = IndexPath(row: NSNotFound, section: section)
        }

        tbl_basicRights.reloadData()
        
        if indexPath != nil {
            tbl_basicRights.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }

    // MARK: - Table view Delegate and Datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return basicRightsList.count
    }

    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandedSections.contains(section) ? 1 : 0
    }

    // MARK: Header properties
    // Propiedad para ajustar el tamaño del encabezado al contenido
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    // Tamaño estimado del encabezado
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 62
    }

    // Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        // Load and fill de cell
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.header.rawValue) as? CourseHeaderTableViewCell

        cell?.headerTitle = basicRightsList[section].name
        cell?.fill_header(forTable: TABLE_SAMPLES)

        cell?.btn_openClose.tag = section
        cell?.tag = section

        // Add Gesture for expand list
        let tapButton = UITapGestureRecognizer(target: self, action: #selector(self.tapSection))
        cell?.btn_openClose.addGestureRecognizer(tapButton)

        let tapHeader = UITapGestureRecognizer(target: self, action: #selector(self.tapSection))
        cell?.addGestureRecognizer(tapHeader)

        // Update Button state
        cell?.btn_openClose.isSelected = expandedSections.contains(section)

        return cell
    }

    // MARK: Footer properties
    // Se agrega la propiedad para ajustar el tamaño del pie de página al contenido
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    // Tamaño estimado del pie de página
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    // fill Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.footer.rawValue) as! CourseFooterTableViewCell
        return cell
    }

    // fill body
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Fill cell for Remember section
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue) as! CourseBodyTableViewCell

        let htmlCSSString = Formats.cssStyles + basicRightsList[indexPath.section].description
        cell.tv_text.attributedText = htmlCSSString.htmlToAttributedString!

        return cell
    }

	// MARK: - Collection view DataSource and FlowLayout Dategate
    // Set number of section in the colection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    //number of the items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return migrationTypeList.count
    }

    //fill collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.aboutTabButtonsCell.rawValue, for: indexPath) as! TabButtonsCollectionViewCell

        cell.basicRightsTabDelegate = self
        cell.titleButton = migrationTypeList[indexPath.row].name.uppercased()
        cell.tab_button.tag = indexPath.row
        cell.tab_button.titleLabel?.textAlignment = .center
        cell.tab_button.isSelected = indexPath.row == currentTab
        cell.underline.isHidden = !cell.tab_button.isSelected
        cell.setButtonTitle()

        return cell
    }

}
