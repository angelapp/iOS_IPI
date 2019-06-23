//
//  IPIIdentifiers.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

enum RefugeRequestHeaders: String, CaseIterable{
    case request = "Solicitud"
    case interview = "Declaración juramentada y entrevistas"
    case studyCase = "Estudio del caso"
    case notification = "Notificacion"
    case remember = "Recuerda que:"
    case whereToGo = "A dónde acudir en %@"
    
    static var asArray: [RefugeRequestHeaders] {return self.allCases}
    
    func asInt() -> Int {
        return RefugeRequestHeaders.asArray.firstIndex(of: self)!
    }
}


// MARK: - Identificador de las vistas
/// Id for each storyboard
enum StoryboardID: String, CaseIterable{
    case LaunchScreen, OnBoarding, Authentication
    case ConfigAvatar, Main, Popup

    static var asArray: [StoryboardID] {return self.allCases}

    func asInt() -> Int {
        return StoryboardID.asArray.firstIndex(of: self)!
    }
}

// Id for each scene into the storyboards
enum ViewControllerID: String, CaseIterable {

    // Onboarding
    case OnBoardingVC, OnBoardingContentVC, OnBoardingPageVC

    // Authentication
    case welcomeVC, signinVC, signupVC, recoveryVC

    // About us
    case aboutUs, aboutUs_tab1, aboutUs_tab2, aboutUs_tab3

    // Avatar
    case choiceAvatarGender, makeAvatar, letsStart

    // Menu
    case leftMenu
    case swMenu
    case contactUs
    case beforeYourTripVC

    // Main
    case main, selectActivies
    case course, courseMessage, progress

    // Plan your trip
    case selectCountries, planYourTripMenu, planYourTrip
    case migrationRequirements
    case countryData, generalData, weatherData, transportData
    case basicRights, basicRights_Tab1, basicRights_Tab2
    case refugeRequest
    case visas
    case nationalizationRequirements
    case phonebook
    case documents
    case savedTrip

    static var asArray: [ViewControllerID] {return self.allCases}

    func asInt() -> Int {
        return ViewControllerID.asArray.firstIndex(of: self)!
    }
}

// Cells Identifiers
enum CellID: String {
    // CElls for Authentication
    case signupCell, signinCell, recoveryPassCell

    // CELLs for About NRC
    case aboutTabButtonsCell, aboutTab01Cell, aboutTab02Cell, aboutTab03Cell

    // CELLs for Contact US
    case contactUsCell

    // Cells for Before of travel
    case beforeHeader, beforeBody, beforeFooter

    // CELLS for Course
    case COURSE01, COURSE02, COURSE03, COURSE04, COURSE05, COURSE06, COURSE07, COURSE08, COURSE09, COURSE10
    case COURSE11, COURSE12, COURSE13, COURSE14, COURSE15, COURSE16, COURSE17, COURSE18, COURSE19, COURSE20
    case COURSE21, COURSE22, COURSE23, COURSE24, COURSE25, COURSE26, COURSE27, COURSE28, COURSE29, COURSE30
    case COURSE31, COURSE32, COURSE33, COURSE34, COURSE35, COURSE36, COURSE37, COURSE38, COURSE39, COURSE40
    case COURSE41, COURSE42

    case header, body, footer, bodyAvatar
    case courseHeader, courseFooter, courseMessage, courseSlider

    // Cells for progress
    case progress

    // cell for plan your trip options
    //Collection cell
    case planYourTripOption
    
    //Table view cell
    case migrationRequirementsBody
}

/// Tag for popup message
enum PopupMessage: Int {
    case failed
    case success
}

/// Observer name's
struct observerName {
    static let stop_loader = "stopLoader"
    static let close_session = "closeSession"
    static let tapped_menuAbout = "menuAboutNRC"
    static let tapped_menuContact = "menuContactus"
}

/// Segue Identifiers
struct segueID {
    static let makeYourAvatar = "makeYourAvatar"
    static let showAvatar = "showAvatar"
    static let swFront = "sw_front"
    static let swRear = "sw_rear"
}

