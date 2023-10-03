////
////  ColorsData.swift
////  ColorsDescriptor
////
////  Created by Belal Hmeidat on 8/23/23.
////
//
//import UIKit
///// class to contain colors and their descriptions
/////has to be class because index will be updated by refernce
//class ColorElement: Codable, Equatable {
//    static func == (lhs: ColorElement, rhs: ColorElement) -> Bool {
//        return lhs.name == rhs.name && lhs.value == rhs.value && lhs.desc == rhs.desc
//    }
//    
//    
//    //MARK: Properties
//    private(set) var value: Int
//    private(set) var name : String
//    private(set) var desc : String
//    var markedForDeletion : Bool = false
//    
//    //MARK: Constructor
//    init(color: Int, name: String, description: String) {
//        self.value = color
//        self.name = name
//        self.desc = description
//    }
//    
//    convenience init(color: UIColor, name: String, description : String){
//        // To get the RGBA components of the color
//        var red: CGFloat = 0.0
//        var green: CGFloat = 0.0
//        var blue: CGFloat = 0.0
//        var alpha: CGFloat = 0.0
//
//        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//
//        // Converting the RGBA components to an integer value
//        let redInt = Int(red * 255)
//        let greenInt = Int(green * 255)
//        let blueInt = Int(blue * 255)
//        let alphaInt = Int(alpha * 255)
//
//        // Comibining the components into a single integer value
//        let colorValue = (alphaInt << 24) | (redInt << 16) | (greenInt << 8) | blueInt
//        
//        // calling original intilizer
//        self.init(color: colorValue, name: name, description: description)
//    }
//}
