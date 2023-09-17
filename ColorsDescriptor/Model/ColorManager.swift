//
//  ColorManager.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/10/23.
//

import Foundation
import UIKit

//Has the color elements ordered list
class ColorManager{
    //MARK: Sigleton
    //single instance of color manager
    static let shared = ColorManager()
    
    //MARK: Constants
    let colorElementsKey = "storedColorElements"
    let defaults = UserDefaults.standard

    //MARK: temp
    //ordered color element list
    private var colorElements = [
       ColorElement(color: 0x1E4C63,
                    name: "Deep Teal",
                    description: "TThis is a detailed description for Deap Teal color"),
            
        ColorElement(color: 0x102D76,
                     name: "Catalina Blue",
                     description: "This is a detailed description for Catalina Blue color"),
            
        ColorElement(color: 0x180B4F,
                      name: "Dark Indingo",
                      description: "This is a detailed description for Dark Indingo color"),

        
        ColorElement(color: 0x3F1156,
                     name: "Ripe Plum",
                     description: "This is a detailed description for Ripe Plum color"),

        ColorElement(color: 0x4E172A,
                   name: "Mulberry Wood",
                   description: "This is a detailed description for Mulberry Wood color"),

       ColorElement(color: 0x781F0E,
                    name: "Kenyan Copper",
                   description: "This is a detailed description for Kenyan Copper color"),

        ColorElement(color:  0x733010,
                   name: "Chestnut",
                   description: "This is a detailed description for Chestnut color"),
        ]
    
    //MARK: Intilizer
    /// Rrivate initilizer for singleton.
    /// Retrieves colors list stored in user defaults if exists sets it as the color list to be displayed in the app
    private init() {
        if let colorListData = UserDefaults.standard.data(forKey: colorElementsKey),
           let storedColorList = try? JSONDecoder().decode([ColorElement].self, from: colorListData) {
            colorElements = storedColorList
            }
    }
    
    //MARK: setters and getter
    /// setter for color elements list
    /// - Parameter colors: color list to be set for viewing the app
    func setColorElements(colors: [ColorElement]){
        colorElements = colors
        saveColorList()
    }
    /// getter for the color elements list
    /// - Returns: the list of colors in ColorManager called colorElements
    func getColorElements() -> [ColorElement]{
        return self.colorElements
    }
    
    //MARK: Functions
    /// function to save the ordered color list in the user defaults using JSON encoding
    private func saveColorList() {
        if let encodedColorList = try? JSONEncoder().encode(colorElements) {
            UserDefaults.standard.set(encodedColorList, forKey: colorElementsKey)
        }
    }
}


