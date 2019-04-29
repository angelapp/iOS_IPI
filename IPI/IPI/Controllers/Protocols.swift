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

// Protocol for manage rgister events
protocol SignupViewControllerDelegate: class {
    func facebookSignup()
    func googleSignup()
    func signupRequest(email:String, password:String, confrimPass: String)
}
