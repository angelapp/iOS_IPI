//
//  Protocols.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

// Protocol for update view in the onBoarding
protocol OnBoardingPageViewControllerDelegate: class {
    func didUpdatePageIndex (currentIndex index: Int)
}

// Protocol for manage register events
protocol SignupViewControllerDelegate: class {
    func facebookSignup()
    func googleSignup()
    func sendMessage(withMessage msn: String)
    func signupRequest(userToRegister: RegisterUserProfileModel)
}

// Protocol for manage Sing In events
protocol SigninViewControllerDelegate: class {
    func sendMessage(withMessage msn: String)
    func signinRequest(userToAuth: RegisterUserProfileModel)
}

// Protocol for manage recovery pass events
protocol RecoveryViewControllerDelegate: class {
    func sendMessage(withMessage msn: String)
    func sendRecoveryPost(email: RegisterUserProfileModel)
    func dismiss()
}

// Protocol for Welcome
protocol WelcomeViewControllerDelegate: class {
    func updateOnboardingState(withState state:Bool)
}

// Protocolo para Sobre NRC
protocol AboutNRCTabProtocol: class {
    func changeTabSelected(toPosition: Int)
}

// Protocol for Contact Form
protocol ContactUsViewControllerDelegate: class {
    func sendMessage(withMessage msn: String)
    func sendRequest(contactForm: ContactForm)
}

// Protocolos del controllador principal
protocol MainProtocol: class {
    func addToContainer(viewControllerID id: ViewControllerID)
    func removeOfContainer()
    func showMessageInMain(withMessage msn: String)
}

// Protocol for Course Manager
protocol CourseViewControllerDelegate : class {
    func nextPage()
    func previusPage()
    func playMV(urlStr: String)
    func audioManager(audioID id: Int, play: Bool)
    func sendRequest(formModel: Array<RequestCompleted>)
    func showMessagePopup(message: String, inbold: String?, type: PopupMessage)
}
