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

    var avatarImage: UIImage!
    var questionaryValue: Int!

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
    public func setCourseFormValue(value: Int) {
        self.questionaryValue = value

        StorageFunctions.saveQuestionaryValue(value: value)
    }

    // MARK: - GETTERS
    public func getAppConfig() -> ApplicationConfiguration! {
        return self.appConfig
    }

    public func getPlanTrip() -> PlanYourTripModel! {
        return self.planYourTrip
    }

    public func getCurrentOption() -> PlanYourTripOptions! {
        return self.currentOption
    }

    public func getPlanTripOptions() -> Array<PlanYourTripOptions> {

        guard planYourTrip != nil else { return [] }

        var options: Array<PlanYourTripOptions> = []

        //Check if Migration requirements is an available option
        if planYourTrip.migrations_requirements != nil, planYourTrip.migrations_requirements.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.MIGRATIONS_REQUIREMENTS.rawValue,
                                               icon: IPI_IMAGES.btn_migration_requirements,
                                               logo: IPI_IMAGES.icon_requisitos,
                                               title: ""))
        }
        //Check if country info is an available option
        if (planYourTrip.general_country_data.currency != nil) ||
           (planYourTrip.temp_by_city != nil && planYourTrip.temp_by_city.count > 0) ||
           (planYourTrip.public_tranportation_info != nil && planYourTrip.public_tranportation_info.count > 0) {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.GENERAL_COUNTRY_DATA.rawValue,
                                               icon: IPI_IMAGES.btn_data
                                               logo: IPI_IMAGES.icon_datos,
                                               title: ""))
        }
        //Check if basic rights is an available option
        if planYourTrip.basic_rights != nil, planYourTrip.basic_rights.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.BASIC_RIGHTS.rawValue,
                                               icon: IPI_IMAGES.btn_basic_rights,
                                               logo: IPI_IMAGES.icon_derechos,
                                               title: ""))
        }
        //Check if refugee apply from is an available option
        if planYourTrip.refugee_aplication != nil, planYourTrip.refugee_aplication.case_study != nil {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.REFUGEE_APLICATION.rawValue,
                                               icon: IPI_IMAGES.btn_refuge_request
                                               logo: IPI_IMAGES.icon_solicitud,
                                               title: ""))
        }
        //Check if visas is an available option
        if planYourTrip.visas != nil, planYourTrip.visas.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.VISAS.rawValue,
                                               icon: IPI_IMAGES.btn_visa
                                               logo: IPI_IMAGES.icon_visas,
                                               title: ""))
        }
        //Check if nationalization requirements is an available option
        if planYourTrip.nationalization_requirements != nil, planYourTrip.nationalization_requirements.description != nil {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.NATIONALIZATION_REQUIREMENTS.rawValue,
                                               icon: IPI_IMAGES.btn_nationalization_requirements
                                               logo: IPI_IMAGES.icon_requisitos,
                                               title: ""))
        }
        //Check if phonebook is an available option
        if planYourTrip.phonebook != nil, planYourTrip.phonebook.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.PHONEBOOK.rawValue,
                                               icon: IPI_IMAGES.btn_phonebook
                                               logo: IPI_IMAGES.icon_directorio,
                                               title: ""))
        }
        //Check if library is an available option
        if planYourTrip.library != nil, planYourTrip.library.count > 0 {
            options.append(PlanYourTripOptions(id: PLAN_YOUR_TRIP_OPTION.LIBRARY.rawValue,
                                               icon: IPI_IMAGES.btn_documents
                                               logo: IPI_IMAGES.icon_documentos,
                                               title: ""))
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

    public func getQuestionaryValue() -> Int {
        if self.questionaryValue == nil {
            self.questionaryValue = StorageFunctions.loadQuestionaryValue()
        }


        printDebugMessage(tag: "load value \(questionaryValue ?? -1125)")
        return self.questionaryValue
    }
}
