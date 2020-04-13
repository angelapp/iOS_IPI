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

let TABLE_COURSE = 100
let TABLE_SAMPLES = 90

let UNSELECT_ID = -1
let NOTCOUNTRY = 100

// MARK: - Índices usados para crear el avatar
enum AvatarGenderIDs: Int {
    case male = 1
    case female
}

enum AvatarPiecesIDs: Int {
    case Head = 1, Eyes, Nose
    case Hair, Accessory
}

enum FileActions: Int {
    case open
    case share
}

// MARK: - Index
/// Indices para las páginas del curso *Conceptos Básicos de Protección Internacional*
enum CURSO_PTN: Int {
    case PAGE_01, PAGE_02, PAGE_03, PAGE_04, PAGE_05, PAGE_06, PAGE_07, PAGE_08, PAGE_09, PAGE_10
    case PAGE_11, PAGE_12, PAGE_13, PAGE_14, PAGE_15, PAGE_16, PAGE_17, PAGE_18, PAGE_19, PAGE_20
    case PAGE_21, PAGE_22, PAGE_23, PAGE_24, PAGE_25, PAGE_26, PAGE_27, PAGE_28, PAGE_29, PAGE_30
    case PAGE_31, PAGE_32, PAGE_33
}

enum AUDIO_ID: Int {
    //Planea tu viaje
    case PLAN_YOUR_TRIP_AUDIO_01, PLAN_YOUR_TRIP_AUDIO_02, PLAN_YOUR_TRIP_AUDIO_03, PLAN_YOUR_TRIP_AUDIO_04
    case PLAN_YOUR_TRIP_AUDIO_05, PLAN_YOUR_TRIP_AUDIO_06, PLAN_YOUR_TRIP_AUDIO_07, PLAN_YOUR_TRIP_AUDIO_08
    case PLAN_YOUR_TRIP_AUDIO_13, PLAN_YOUR_TRIP_AUDIO_14, PLAN_YOUR_TRIP_AUDIO_15, PLAN_YOUR_TRIP_AUDIO_16

    //Antes de viajar
    case PLAN_YOUR_TRIP_AUDIO_09, PLAN_YOUR_TRIP_AUDIO_10, PLAN_YOUR_TRIP_AUDIO_11, PLAN_YOUR_TRIP_AUDIO_12

    //Curos CBPI
    case CURSO_PTN_01, CURSO_PTN_02, CURSO_PTN_03, CURSO_PTN_04
    case CURSO_PTN_05, CURSO_PTN_06, CURSO_PTN_07, CURSO_PTN_08
}

/// Tags para las opciones del menu Planea tu viaje
enum PLAN_YOUR_TRIP_OPTION: Int {
    case BASIC_RIGHTS, MIGRATIONS_REQUIREMENTS, GENERAL_COUNTRY_DATA
    case NATIONALIZATION_REQUIREMENTS, REFUGEE_APLICATION, VISAS
    case PHONEBOOK, LIBRARY
}
