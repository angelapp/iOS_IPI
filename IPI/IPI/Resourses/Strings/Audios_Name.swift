//
//  Audios_Name.swift
//  IPI
//
//  Created by Felipe Zamudio on 08/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation

// MARK: - Títulos de los audios
/// Nombre de los audios para el avatar Fenenino
enum AUDIO_FEMALE: String {
    //Planea tu viaje
    case mer_ptv_m_05 //Requisitos
    case mer_ptv_m_06 //Datos utiles 1);
    case mer_ptv_m_07 // Derechos
    case mer_ptv_m_08 //Solcitud refugio
    case mer_ptv_m_13 // visas
    case mer_ptv_m_14 // Req nacionalización
    case mer_ptv_m_15 // directorio
    case mer_ptv_m_16 // documentos
    case mer_ptv_m_09 // avatar 1 solcitud de refugio panama
    case mer_ptv_m_10 // avatar 1 solcitud de refugio ecuador
    case mer_ptv_m_11 // avatar 1 solcitud de refugio colombia
    case mer_ptv_m_12 // avatar 1 solcitud de refugio peru

    //Antes de viajar
    case mer_ptv_m_01, mer_ptv_m_02, mer_ptv_m_03, mer_ptv_m_04

    //Curos CBPI
    case mer_cur_m_01, mer_cur_m_02, mer_cur_m_03, mer_cur_m_04
    case mer_cur_m_05, mer_cur_m_06, mer_cur_m_07, mer_cur_m_08
}

/// Nombre de los audios para el avatar Masculino
enum AUDIO_MALE: String {
    //Planea tu viaje
    case mer_ptv_h_05 //Requisitos
    case mer_ptv_h_06 //Datos utiles 1);
    case mer_ptv_h_07 // Derechos
    case mer_ptv_h_08 //Solcitud refugio
    case mer_ptv_h_13 // visas
    case mer_ptv_h_14 // Req nacionalización
    case mer_ptv_h_15 // directorio
    case mer_ptv_h_16 // documentos
    case mer_ptv_h_09 // avatar 1 solcitud de refugio panama
    case mer_ptv_h_10 // avatar 1 solcitud de refugio ecuador
    case mer_ptv_h_11 // avatar 1 solcitud de refugio colombia
    case mer_ptv_h_12 // avatar 1 solcitud de refugio peru

    //Antes de viajar
    case mer_ptv_h_01, mer_ptv_h_02, mer_ptv_h_03, mer_ptv_h_04

    //Curos CBPI
    case mer_cur_h_01, mer_cur_h_02, mer_cur_h_03, mer_cur_h_04
    case mer_cur_h_05, mer_cur_h_06, mer_cur_h_07, mer_cur_h_08
}

// MARK: - Funciones para obtener el nombre del audio
/**
 Obtiene el nombre del audio a reproducir de acuerdo al género del Avatar

 - Parameter forAudio: ID del audio
 - Returns: Nombre del audio guardado.
 */
func get_AudioName(forAudio id: Int) -> String {
    
    let avatar_gender = AplicationRuntime.sharedManager.getAvatarGenderID()

    switch id {
    //Planea tu viaje
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_01.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_05.rawValue : AUDIO_FEMALE.mer_ptv_m_05.rawValue //Requisitos
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_02.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_06.rawValue : AUDIO_FEMALE.mer_ptv_m_06.rawValue //Datos utiles 1);
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_03.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_07.rawValue : AUDIO_FEMALE.mer_ptv_m_07.rawValue // Derechos
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_04.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_08.rawValue : AUDIO_FEMALE.mer_ptv_m_08.rawValue //Solcitud refugio
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_05.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_13.rawValue : AUDIO_FEMALE.mer_ptv_m_13.rawValue // visas
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_06.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_14.rawValue : AUDIO_FEMALE.mer_ptv_m_14.rawValue // Req nacionalización
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_07.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_15.rawValue : AUDIO_FEMALE.mer_ptv_m_15.rawValue // directorio
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_08.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_16.rawValue : AUDIO_FEMALE.mer_ptv_m_16.rawValue // documentos
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_13.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_09.rawValue : AUDIO_FEMALE.mer_ptv_m_09.rawValue // avatar 1 solcitud de refugio panama
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_14.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_10.rawValue : AUDIO_FEMALE.mer_ptv_m_10.rawValue // avatar 1 solcitud de refugio ecuador
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_15.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_11.rawValue : AUDIO_FEMALE.mer_ptv_m_11.rawValue // avatar 1 solcitud de refugio colombia
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_16.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_12.rawValue : AUDIO_FEMALE.mer_ptv_m_12.rawValue // avatar 1 solcitud de refugio peru
        
        //Antes de viajar
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_09.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_01.rawValue : AUDIO_FEMALE.mer_ptv_m_01.rawValue // Condición migratoria
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_10.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_02.rawValue : AUDIO_FEMALE.mer_ptv_m_02.rawValue // Estatus de Refugiado
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_11.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_03.rawValue : AUDIO_FEMALE.mer_ptv_m_03.rawValue // Temporal o en transito
        
    case AUDIO_ID.PLAN_YOUR_TRIP_AUDIO_12.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_ptv_h_04.rawValue : AUDIO_FEMALE.mer_ptv_m_04.rawValue // Permanente
        
        //Curos CBPI
        
    case AUDIO_ID.CURSO_PTN_01.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_cur_h_01.rawValue : AUDIO_FEMALE.mer_cur_m_01.rawValue
        
    case AUDIO_ID.CURSO_PTN_02.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_cur_h_02.rawValue : AUDIO_FEMALE.mer_cur_m_02.rawValue
        
    case AUDIO_ID.CURSO_PTN_03.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_cur_h_03.rawValue : AUDIO_FEMALE.mer_cur_m_03.rawValue
        
    case AUDIO_ID.CURSO_PTN_04.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_cur_h_04.rawValue : AUDIO_FEMALE.mer_cur_m_04.rawValue
        
    case AUDIO_ID.CURSO_PTN_05.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_cur_h_05.rawValue : AUDIO_FEMALE.mer_cur_m_05.rawValue
        
    case AUDIO_ID.CURSO_PTN_06.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_cur_h_06.rawValue : AUDIO_FEMALE.mer_cur_m_06.rawValue
        
    case AUDIO_ID.CURSO_PTN_07.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_cur_h_07.rawValue : AUDIO_FEMALE.mer_cur_m_07.rawValue
        
    case AUDIO_ID.CURSO_PTN_08.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.mer_cur_h_08.rawValue : AUDIO_FEMALE.mer_cur_m_08.rawValue
        
    default:
        return nullString
    }
}
