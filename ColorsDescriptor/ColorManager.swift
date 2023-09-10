//
//  ColorManager.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/10/23.
//

import Foundation
import UIKit


class ColorManager{
    
    static let colorManager = ColorManager()
    
    private var colorElements = [
       ColorElement(color: UIColor(red: 30/255, green: 76/255, blue: 99/255.0, alpha: 1 ),
                                           name: "Deep Teal",
                                           description: "TThis is a detailed description for Deap Teal color"),
            
        ColorElement(color: UIColor(red: 16/255, green: 45/255, blue: 118/255, alpha: 1),
                                               name: "Catalina Blue",
                                               description: "This is a detailed description for Catalina Blue color"),
            
        ColorElement(color: UIColor(red: 24/255, green: 11/255, blue: 79/255, alpha: 1),
                                              name: "Dark Indingo",
                                              description: "This is a detailed description for Dark Indingo color"),
        
        
        ColorElement(color: UIColor(red: 63/255, green: 17/255, blue: 86/255, alpha: 1),
                                           name: "Ripe Plum",
                                           description: "This is a detailed description for Ripe Plum color"),

        ColorElement(color: UIColor(red: 78/255, green: 23/255, blue: 42/255, alpha: 1),
                                               name: "Mulberry Wood",
                                               description: "This is a detailed description for Mulberry Wood color"),

       ColorElement(color: UIColor(red: 120/255, green: 31/255, blue: 14/255, alpha: 1),
                                                name: "Kenyan Copper",
                                               description: "This is a detailed description for Kenyan Copper color"),

        ColorElement(color:  UIColor(red: 115/255, green: 48/255, blue: 16/255, alpha: 1),
                                           name: "Chestnut",
                                           description: "This is a detailed description for Chestnut color"),
        ]
    //Mark: private initilizer for singleton
    private init() {
    }
    
    func setColorElements(colors: [ColorElement]){
        self.colorElements = colors
    }
    
    func getColorElements() -> [ColorElement]{
        return self.colorElements
    }
    
    
    
    
    
    
    
}


