//
//  Colors.swift
//  IPI
//
//  Created by Felipe Zamudio on 20/04/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import Foundation
import UIKit

class Colors: NSObject {
    
    /// Optiene el color desde su referencia HEX
    /// - Parameter from: Hexa del color
    /// - Returns: UIColor correspondiente al hexa de entrada
    func getColor (from hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
