//
//  Protocols.swift
//  IPI
//
//  Created by Felipe Zamudio on 27/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

// Delegate for update view in the onBoarding
protocol OnBoardingPageViewControllerDelegate: class {
    func didUpdatePageIndex (currentIndex index: Int)
}
