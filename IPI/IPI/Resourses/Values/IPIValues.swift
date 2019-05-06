//
//  IPIValues.swift
//  IPI
//
//  Created by Felipe Zamudio on 1/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation
import UIKit

let HEAD_GRID = 0
let EYES_GRID = 1
let NOSE_GRID = 2
let HAIR_GRID = 3
let ACCESSORIES_GRID = 4

// MARK: - Índices usados para crear el avatar
enum AvatarGenderIDs: Int {
    case male = 1
    case female
}

enum AvatarPiecesIDs: Int {
    case Head = 1, Eyes, Nose
    case Hair, Accessory
}
