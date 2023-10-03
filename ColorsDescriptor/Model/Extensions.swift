//
//  Extensions.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/20/23.
//

import Foundation
import UIKit

///Color int -> UIColor conversion
extension UIColor {
    convenience init(value: Int) {
            let r = CGFloat((value >> 16) & 0xFF) / 255.0
            let g = CGFloat((value >> 8) & 0xFF) / 255.0
            let b = CGFloat(value & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1) //fixed opaque

        }
}

extension UIColor {
    func convertToValue()->Int{
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        // Converting the RGBA components to an integer value
        let redInt = Int(red * 255)
        let greenInt = Int(green * 255)
        let blueInt = Int(blue * 255)
        let alphaInt = Int(alpha * 255)
        
        // Comibining the components into a single integer value
        let colorValue = (alphaInt << 24) | (redInt << 16) | (greenInt << 8) | blueInt
        
        return colorValue
    }
}


