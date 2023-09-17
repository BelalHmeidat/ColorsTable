//
//  ColorsData.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit
// struct to contain colors and their descriptions
struct ColorElement: Codable {
    
    //MARK: Properties
    private(set) var color: Int
    private(set) var name : String
    private(set) var description : String
    
    //MARK: Constructor
    init(color: Int, name: String, description: String) {
        self.color = color
        self.name = name
        self.description = description
    }
}

//MARK: Extension
extension UIColor {
    convenience init(value: Int) {
            let r = CGFloat((value >> 16) & 0xFF) / 255.0
            let g = CGFloat((value >> 8) & 0xFF) / 255.0
            let b = CGFloat(value & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1)

        }
}
