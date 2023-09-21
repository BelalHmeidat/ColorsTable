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
        self.init(red: r, green: g, blue: b, alpha: 1)

        }
}


