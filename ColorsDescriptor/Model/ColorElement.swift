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
    
    init(color: UIColor, name: String, description : String){
        // To get the RGBA components of the color
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        // Converting the RGBA components to an integer value
        let redInt = Int(red * 255)
        let greenInt = Int(green * 255)
        let blueInt = Int(blue * 255)
        let alphaInt = Int(alpha * 255)

        // Comibining the components into a single integer value
        let colorValue = (alphaInt << 24) | (redInt << 16) | (greenInt << 8) | blueInt
        
        // calling original intilizer
        self.init(color: colorValue, name: name, description: description)
    }
}
