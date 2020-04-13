//
//  AplicationRuntime.swift
//  IPI
//
//  Created by Felipe Zamudio on 1/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation
import UIKit

class AplicationRuntime {

    // MARK: - Private properties
    private var appConfig: ApplicationConfiguration!
    private var planYourTrip: PlanYourTripModel!
    private var currentOption: PlanYourTripOptions!
    private var userData: RegisterUserResponse!
    private var progress: CoursesProgress!
    private var avatar: MyAvatarPieces!
    private var answers: PNPIAnswers!

    var avatarImage: UIImage!

    weak var mainDelegate: MainProtocol?
    weak var courseDelegate: CourseViewControllerDelegate?

    // MARK: - Singleton instance
    class var sharedManager: AplicationRuntime {
        struct Static {
            static let instance = AplicationRuntime()
        }
        return Static.instance
    }

    // MARK: - Setters
    

    public func setAppConfig(config: ApplicationConfiguration!){
        self.appConfig = config
    }

    public func setUserData(user: RegisterUserResponse!) {
        self.userData = user
    }

    public func setAvatarPieces(avatarPieces: MyAvatarPieces) {
        self.avatar = avatarPieces
    }

    public func setAvatarGenderID(id: Int) {
        self.avatar.genderID = id
    }

    public func setAvatarImage(img: UIImage) {
        self.avatarImage = img
    }

    public func setProgress(progress: CoursesProgress) {
        self.progress = progress
    }

    public func setPlanTrip(plan: PlanYourTripModel!) {
        self.planYourTrip = plan
    }

    public func setCurrentOption(currentOption: PlanYourTripOptions!) {
        self.currentOption = currentOption
    }

    /// Guarda el indice del curso
    public func setProgress(progress: Int) {
        if self.progress == nil { self.progress = CoursesProgress() }
        self.progress.COURSE_INDEX = progress

        StorageFunctions.saveProgress(progress: self.progress)
    }

    /// Guarda el valor de las respuestas afirmativas
    public func setAnswersValue(answers: PNPIAnswers) {
        self.answers = answers

        StorageFunctions.saveAnsewrsInLocal(answers: answers)
    }

    // MARK: - GETTERS

    public func getAppConfig() -> ApplicationConfiguration! {
        return self.appConfig
    }

    public func getDocuments(fromType id: Int) -> Array<LibraryDocument> {
        guard planYourTrip != nil, planYourTrip.library != nil
            else { return [] }

        var documentList: Array<LibraryDocument> = []
        for document in self.planYourTrip.library {
            if document.doc_type == id {
                documentList.append(document)
            }
        }

        return documentList
    }

    public func getPlanTrip() -> PlanYourTripModel! {
        return self.planYourTrip
    }

    /**
     Function to search country by itselft ID **defult = nil**

     - Parameter fromID: country's ID
     - Returns: Country
     */
    public func getCountry(fromID id: Int) -> Country! {

        //Check if exist config and countries data
        guard self.appConfig != nil, self.appConfig.countries != nil else {
            return nil
        }

        // Looking for country by ID
        for country in self.appConfig.countries {
            if country.id == id {
                return country
            }
        }

        // Defautl return value
        return nil
    }

    /**
     Function to get name of the city according with target country

     - Parameter forID: Id of the city to search
     - Returns: city name **defult, empty**
     */
    public func getCityName(forID id: Int) -> String {
        var name = nullString

        //Check if exist data
        guard planYourTrip != nil,  let country = getCountry(fromID: self.planYourTrip.desCountryID)
            else { return name }

        //Search city
        for city in country.country_cities {
            if city.id == id {
                name = city.name
                break
            }
        }

        return name
    }

    public func getTransportByCity() -> Array<TransportInfoList> {

        var transportByCity: Array<TransportInfoList> = []

        //Check if exist data for migration condition types
        guard planYourTrip != nil, planYourTrip.public_tranportation_info != nil, planYourTrip.public_tranportation_info.count > 0
            else { return transportByCity }

        /// Arreglo auxiliar para mantener los Id de las ciudades Origen
        var aux_origin_id: Array<Int> = []
        /// Auxiliar para mantener la dupla Origen_Destino
        var aux_destination_id: Array<String> = []

        // ORDER CITY TRANSPORT BY ORIGIN CITY
        for transportInfo in planYourTrip.public_tranportation_info {

            // Create destination aux tag (ORIGENID_TARGETID)
            let destinationTAG = String(transportInfo.origin_city) + "_" + String(transportInfo.target_city)

            if !aux_origin_id.contains(transportInfo.origin_city) {
                let cityOrigin = TransportInfoList(name: getCityName(forID: transportInfo.origin_city))

                aux_origin_id.append(transportInfo.origin_city)
                aux_destination_id.append(destinationTAG)

                cityOrigin.targetList.append(transportInfo)
                transportByCity.append(cityOrigin)
            }
            else {
                // update list when the city origin exist
                if let pos = aux_origin_id.index(of: transportInfo.origin_city) {
                    // The right is added to target list if it has not been added
                    if !aux_destination_id.contains(destinationTAG) {
                        transportByCity[pos].targetList.append(transportInfo)
                        aux_destination_id.append(destinationTAG)
                    }
                }
            }
        }

        return transportByCity
    }

    /**
     Function to get cities of target country, with avaible phonebook
     **defult = empty**

     - Returns: City List
     */
	public func getCities() -> Array<City> {

        //Check if exist data
        guard planYourTrip != nil,  let country = getCountry(fromID: self.planYourTrip.desCountryID)
			else { return [] }

        //Init phonebook for cities
        for city in country.country_cities {
            city.cityPhonebook = []
        }

        /// Arreglo auxiliar para mantener los Id de las Ciudades que ya sean agregado al arreglo de retorno
        var aux: Array<Int> = []
        var aux2: Array<Int> = []
		var cities: Array<City> = []

		// Looking available cities in phonebook
        for phone in planYourTrip.phonebook{

            // Looking cities Data
            cityLoop: for city in country.country_cities {

                if city.id == phone.city {

                    // Verifica si la ciudad ya se encuentar en el arreglo de retorno
                    if !aux.contains(city.id) {

                        // Init city phonebook if it's null
                        if city.cityPhonebook == nil { city.cityPhonebook = [] }

                        // Add de current phonebook add sub-array phonebook
                        if !aux2.contains(phone.id) {
                            city.cityPhonebook.append(phone)
                            aux2.append(phone.id)
                        }

                        cities.append(city)
                        aux.append(city.id)
                    }
                    else {
                        // update sub-phonebook array when the city exist
                        if let pos = aux.index(of: city.id) {
                            if !aux2.contains(phone.id) {
                                cities[pos].cityPhonebook.append(phone)
                                aux2.append(phone.id)
                            }
                        }
                    }

                    // Leave innerLoop
                    break cityLoop
                }
            }
        }

//        for city in cities {
//            printDebugMessage(tag: "\(city.name ?? "nippon") tiene: \(city.cityPhonebook.count) numeros")
//        }

        return cities
	}

    /**
     Function to get migration condition list,
     with available migration type

     **defult = empty**

     - Returns: Migration Condition Type List
     */
    public func getConditionList() -> Array<MigrationConditionType> {

        //Check if exist data for migration condition types
        guard appConfig != nil, appConfig.migration_condition_types != nil, appConfig.migration_condition_types.count > 0
            else { return [] }

        //Check if exist data for document condition types
        guard appConfig != nil, appConfig.document_condition_types != nil, appConfig.document_condition_types.count > 0
            else { return [] }

        //Check if exist data for Basic Rights
        guard planYourTrip != nil, planYourTrip.basic_rights != nil, planYourTrip.basic_rights.count > 0
            else { return [] }

        //Init basic_rights for document_condition_list
        for doc in appConfig.document_condition_types {
            doc.basic_right_list = []
        }

        //Init document_condition_list for migration_condition_types
        for conditionType in appConfig.migration_condition_types {
            conditionType.document_condition_list = []
        }

        /// Arreglo auxiliar para mantener los Id de los elementos que ya sean agregado
        var aux_right_id: Array<Int> = []
        var aux_documents_id: Array<Int> = []

        var documentConditionList: Array<DocumentConditionType> = []

        // ORDER BASIC RIGHTS BY DOCUMENT CONDITION TYPE
        for right in planYourTrip.basic_rights {

            // Looking for document conditon type
            docLoop: for doc in appConfig.document_condition_types {

                if doc.id == right.document_condition {

                    // check if document has been added into document condition list
                    if !aux_documents_id.contains(doc.id) {

                        // Init basic rights List if it's null
                        if doc.basic_right_list == nil { doc.basic_right_list = [] }

                        // The right is added to basic_right_list if it has not been added to any other
                        if !aux_right_id.contains(right.id) {
                            doc.basic_right_list.append(right)
                            aux_right_id.append(right.id)
                        }

                        documentConditionList.append(doc)
                        aux_documents_id.append(doc.id)
                    }
                    else {
                        // update basic_right_list when the document exist
                        if let pos = aux_documents_id.index(of: doc.id) {
                            // The right is added to basic_right_list if it has not been added to any other
                            if !aux_right_id.contains(right.id) {
                                documentConditionList[pos].basic_right_list.append(right)
                                aux_right_id.append(right.id)
                            }
                        }
                    }

                    // Leave innerLoop
                    break docLoop
                }
            }
        }

        // Clean aux document id
        aux_documents_id = []
        var aux_migration_id: Array<Int> = []

        var migrationConditionList: Array<MigrationConditionType> = []

        // ORDER DOCUMENT CONDITION TYPE BY MIGRATION CONDITION TYPE
        for document in documentConditionList {

            // Looking for migration conditon type
            migrationLoop: for migration in appConfig.migration_condition_types {

                if migration.id == document.migration_condition {

                    // check if document has been added into document condition list
                    if !aux_migration_id.contains(migration.id) {

                        // Init basic rights List if it's null
                        if migration.document_condition_list == nil { migration.document_condition_list = [] }

                        // The document is added to document_condition_list if it has not been added to any other
                        if !aux_documents_id.contains(document.id) {
                            migration.document_condition_list.append(document)
                            aux_documents_id.append(document.id)
                        }

                        migrationConditionList.append(migration)
                        aux_migration_id.append(migration.id)
                    }
                    else {
                        // update document_condition_list when the document exist
                        if let pos = aux_migration_id.index(of: migration.id) {
                            // The document is added to document_condition_list if it has not been added to any other
                            if !aux_documents_id.contains(document.id) {
                                migrationConditionList[pos].document_condition_list.append(document)
                                aux_documents_id.append(document.id)
                            }
                        }
                    }

                    // Leave innerLoop
                    break migrationLoop
                }
            }
        }

//        for m in migrationConditionList {
//            printDebugMessage(tag: "\(m.id ?? -1) \(m.name ?? "nippon")")
//            for d in m.document_condition_list {
//                printDebugMessage(tag: "\t -\(d.id ?? -1) \(d.name ?? "Kioto")")
//                for r in d.basic_right_list {
//                    printDebugMessage(tag: "\t\t * \(r.id ?? -1) \(r.name ?? "France")")
////                    printDebugMessage(tag: "\t\t * \(r.description ?? "France")")
//                }
//            }
//        }

        return migrationConditionList
    }

    public func getCurrentOption() -> PlanYourTripOptions! {
        return self.currentOption
    }

    public func getGeneralDataList() -> Array<GeneralCountryData> {

        var list: Array<GeneralCountryData> = []

        // check if exist data
        guard planYourTrip != nil, planYourTrip.general_country_data != nil else { return list }

        var countryName = nullString
        if let country = getCountry(fromID: planYourTrip.general_country_data.country) {
            countryName = country.name
        }

        // Add currency Info
        if planYourTrip.general_country_data.currency != nil {
            list.append(GeneralCountryData(
                icon: IPI_IMAGES.icon_moneda,
                description: planYourTrip.general_country_data.currency,
                title: Labels.currency))
        }
        // Add TRM Info
        if planYourTrip.general_country_data.trm != nil {
            list.append(GeneralCountryData(
                icon: IPI_IMAGES.icon_conversion,
                description: planYourTrip.general_country_data.trm,
                title: Labels.trm))
        }
        // Add migration authority Info
        if planYourTrip.general_country_data.migration_authority != nil {
            list.append(GeneralCountryData(
                icon: IPI_IMAGES.icon_autoridad,
                description: planYourTrip.general_country_data.migration_authority,
                title: Labels.migration_authority))
        }
        // Add how to call from inside Info
        if planYourTrip.general_country_data.call_from_inside_requirements != nil {
            list.append(GeneralCountryData(
                icon: IPI_IMAGES.icon_llamada_local,
                description: planYourTrip.general_country_data.call_from_inside_requirements,
                title: String(format: Labels.call_from_inside_requirements, countryName)))
        }
        // Add how to call from outside
        if planYourTrip.general_country_data.call_from_outside_requirements != nil {
            list.append(GeneralCountryData(
                icon: IPI_IMAGES.icon_llamada_exterior,
                description: planYourTrip.general_country_data.call_from_outside_requirements,
                title: String(format: Labels.call_from_outside_requirements, countryName)))
        }


        return list
    }

    public func getPlanTripOptions() -> Array<PlanYourTripOptions> {

        guard planYourTrip != nil else { return [] }

        var options: Array<PlanYourTripOptions> = []

        
        //Check if Migration requirements is an available option
        if planYourTrip.migrations_requirements != nil, planYourTrip.migrations_requirements.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.MIGRATIONS_REQUIREMENTS.rawValue,
                                               icon: IPI_IMAGES.btn_migration_requirements,
                                               logo: IPI_IMAGES.icon_requisitos,
                                               title: Labels.migration_requirements,
                                               audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_01.rawValue))
        }
        //Check if country info is an available option
            if (planYourTrip.general_country_data?.currency != nil) ||
               (planYourTrip.temp_by_city != nil && planYourTrip.temp_by_city.count > 0) ||
               (planYourTrip.public_tranportation_info != nil && planYourTrip.public_tranportation_info.count > 0) {
                options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.GENERAL_COUNTRY_DATA.rawValue,
                                                   icon: IPI_IMAGES.btn_data,
                                                   logo: IPI_IMAGES.icon_datos,
                                                   title: String(format: Labels.country_general_data, getCountry(fromID: self.planYourTrip.desCountryID, getName: true).uppercased()),
                                                   audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_02.rawValue))
            }
        
        
        //Check if basic rights is an available option
        if planYourTrip.basic_rights != nil, planYourTrip.basic_rights.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.BASIC_RIGHTS.rawValue,
                                               icon: IPI_IMAGES.btn_basic_rights,
                                               logo: IPI_IMAGES.icon_derechos,
                                               title: Labels.basic_rights,
                                               audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_03.rawValue))
        }
        
        //Check if refugee apply from is an available option
        if planYourTrip.refugee_aplication != nil, planYourTrip.refugee_aplication.case_study != nil {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.REFUGEE_APLICATION.rawValue,
                                               icon: IPI_IMAGES.btn_refuge_request,
                                               logo: IPI_IMAGES.icon_solicitud,
                                               title: Labels.refuge_request,
                                               audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_04.rawValue))
        }
        
        //Check if visas is an available option
        if planYourTrip.visas != nil, planYourTrip.visas.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.VISAS.rawValue,
                                               icon: IPI_IMAGES.btn_visa,
                                               logo: IPI_IMAGES.icon_visas,
                                               title: Labels.visa,
                                               audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_05.rawValue))
        }
        
        //Check if nationalization requirements is an available option
        if planYourTrip.nationalization_requirements != nil, planYourTrip.nationalization_requirements.description != nil {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.NATIONALIZATION_REQUIREMENTS.rawValue,
                                               icon: IPI_IMAGES.btn_nationalization_requirements,
                                               logo: IPI_IMAGES.icon_resquisitos_nac,
                                               title: Labels.nationalization_requirements,
                                               audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_06.rawValue))
        }
        
        //Check if phonebook is an available option
        if planYourTrip.phonebook != nil, planYourTrip.phonebook.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.PHONEBOOK.rawValue,
                                               icon: IPI_IMAGES.btn_phonebook,
                                               logo: IPI_IMAGES.icon_directorio,
                                               title: Labels.phonebook,
                                               audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_07.rawValue))
        }
        
        //Check if library is an available option
        if planYourTrip.library != nil, planYourTrip.library.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.LIBRARY.rawValue,
                                               icon: IPI_IMAGES.btn_documents,
                                               logo: IPI_IMAGES.icon_documentos,
                                               title: Labels.documents,
                                               audioID: AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_08.rawValue))
        }

        return options
    }

    // MARK: - getters for - Spinners

    // Get for contact us from. Type of Request Spinner
    public func getContactFormTypeList() -> Array<ContactFormType> {
        guard appConfig != nil, appConfig.contact_form_type_Array != nil else {
            return []
        }
        return appConfig.contact_form_type_Array
    }

    // MARK: - Getters for validations
    public func getPswRegex() -> String {
        guard appConfig != nil, appConfig.general_configuration.psw_regular_expression != nil else {
            return nullString
        }
        return appConfig.general_configuration.psw_regular_expression
    }

    public func getPswErrorMessage() -> String {
        guard appConfig != nil, appConfig.general_configuration.psw_error_recomendation != nil else {
            return nullString
        }
        return appConfig.general_configuration.psw_error_recomendation
    }

    // MARK: - urls
    public func getURLTerms() -> String {
        guard appConfig != nil, appConfig.general_configuration.terms_condition_url != nil else {
            return nullString
        }
        return appConfig.general_configuration.terms_condition_url
    }

    // MARK: - Avatar
    public func getAvatarImage() -> UIImage! {
        return self.avatarImage
    }

    public func getAvatarGenderID() -> Int {
        guard self.avatar != nil, self.avatar.genderID != nil else { return AvatarGenderIDs.female.rawValue }
        return self.avatar.genderID
    }

    public func getAvatarPieces() -> MyAvatarPieces! {
        return self.avatar
    }

    public func getPiecesList(forPart part: AvatarPiecesIDs) -> Array<AvatarPiece> {

        guard appConfig != nil, appConfig.avatar_pieces_Array != nil, self.avatar != nil, self.avatar.genderID != nil else {
            return []
        }

        var piecesList: Array<AvatarPiece> = []

        for pieces in appConfig.avatar_pieces_Array {
            if pieces.gender == self.avatar.genderID && pieces.body_part == part.rawValue {
                piecesList.append(pieces)
            }
        }

        return piecesList
    }

    // MARK: - PLAN YOUR TRIP
    /**
     - Parameter fromCountry: ID de la nacionalidad o pais de origen
     - Returns: Lista de paises
    */
    public func getCountries(fromCountry id:Int? = UNSELECT_ID) -> Array<Country> {

        guard appConfig != nil, appConfig.countries != nil else {
            return []
        }

        guard id != UNSELECT_ID else {
            return appConfig.countries
        }

        // Filtra lista de paises Excluyendo el pais de origen
        var countries: Array<Country> = []

        for country in appConfig.countries {
            if country.id != id {
                countries.append(country)
            }
        }

        return countries
    }

    /**
     Return information about counrty shortname, country name or country nationality

     - Parameter fromID: country ID
     - Parameter getName: (Optional) if true returns the name of country
     - Parameter getNationality: (Optional) if true returns country's nationality
     - Returns: country Info by default returns country shortname
     */
    public func getCountry(fromID id: Int, getName: Bool? = false, getNationality: Bool? = false ) -> String {

        guard appConfig != nil, appConfig.countries != nil else {
            return nullString
        }

        for country in appConfig.countries {
            if country.id == id {
                if getName != nil, getName! { return country.name }
                else if getNationality != nil, getNationality! { return country.nationality}
                else { return country.abreviature }
            }
        }

        return nullString
    }

    // MARK: - USER DATA
    public func getUser() -> UserSerializer! {
        guard let user = userData?.user else { return nil }
        return user
    }

    public func getUserID() -> Int! {
        guard let id = userData?.user?.id else { return nil }
        return id
    }

    public func getUserToken() -> String {
        guard let token = userData?.token else { return nullString }
        return token
    }

    public func getIndex() -> Int {
        guard progress != nil else { return 0 }
        return progress.COURSE_INDEX != nil ? progress.COURSE_INDEX : 0
    }

    public func getAnswersValue() -> PNPIAnswers {
        self.answers = StorageFunctions.getAnswers()
        return self.answers
    }
}
