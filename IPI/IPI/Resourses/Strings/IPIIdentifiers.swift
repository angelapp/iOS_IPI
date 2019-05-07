//
//  IPIIdentifiers.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

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

    // Onboarding tags
    case OnBoardingVC, OnBoardingContentVC, OnBoardingPageVC

    // Authentication tags
    case welcomeVC, signinVC, signupVC, recoveryVC

    // About us tags
    case aboutUs, aboutUs_tab1, aboutUs_tab2, aboutUs_tab3

    // Avatar tags
    case choiceAvatarGender, makeAvatar, letStart

    // Menu tags
    case leftMenu, swMenu

    case contactUsVC

    static var asArray: [ViewControllerID] {return self.allCases}

    func asInt() -> Int {
        return ViewControllerID.asArray.firstIndex(of: self)!
    }
}

// Cells Identifiers
enum CellID: String {
    case signupCell, signinCell, recoveryPassCell
    case aboutTabButtonsCell, aboutTab01Cell, aboutTab02Cell, aboutTab03Cell
    case contactUsCell
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

