//
//  IPIIdentifiers.swift
//  IPI
//
//  Created by Felipe Zamudio on 26/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

// MARK: - Identificador de las vistas

// Id for each storyboard
enum StoryboardID: String {
    case Main, LaunchScreen, OnBoarding
}

// Id for each scene into the storyboards
enum ViewControllerID: String {
    case OnBoardingVC, OnBoardingContentVC, OnBoardingPageVC
    case welcomeVC, signinVC, signupVC, recoveryVC
}

// Id númerico de las vistas
enum ViewControllerTag : Int {
    case OnBoardingVC, OnBoardingContentVC, OnBoardingPageVC
    case welcomeVC, signinVC, signupVC, recoveryVC
}

// Cells Identifiers
enum CellID: String {
    case signupCell
}

