//
//  ColorsData.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit
// struct to contain colors and their descriptions
struct ColorElement {
    static var colorElements : [ColorElement] = [] // not needed
    
    private var _color : UIColor
    private var _name : String
    private var _description : String
    
    init(color: UIColor, name: String, description: String) {
        self._color = color
        self._name = name
        self._description = description
        ColorElement.colorElements.append(self)
    }
    //getters
    var color : UIColor{
        get {
            return self._color
        }
    }
    var name : String {
        get {
            return self._name
        }
    }
    var desc : String {
        get {
            return self._description
        }
    }
}

struct ColorsData {
    //list of color objects
    static let colorElements : [ColorElement] = [deepTeal, catalinaBlue, darkIndingo, ripePlum, mulberryWood, kenyanCopper, chestnut]
    // size of list to determine num of rows in the table
    static let colorsCount = colorElements.count
    
    //colors inspected from the task description to initilize in color objects
    static var deepTealColor = UIColor(red: 30/255, green: 76/255, blue: 99/255.0, alpha: 1 )
    static var catalinaBlueColor = UIColor(red: 16/255, green: 45/255, blue: 118/255, alpha: 1)
    static var darkIndingoColor = UIColor(red: 24/255, green: 11/255, blue: 79/255, alpha: 1)
    static var ripePlumColor = UIColor(red: 63/255, green: 17/255, blue: 86/255, alpha: 1)
    static var mulberryWoodColor = UIColor(red: 78/255, green: 23/255, blue: 42/255, alpha: 1)
    static var kenyanCopperColor = UIColor(red: 120/255, green: 31/255, blue: 14/255, alpha: 1)
    static var chestnutColor = UIColor(red: 115/255, green: 48/255, blue: 16/255, alpha: 1)
    
    
    //creating color objects
    static var deepTeal = ColorElement(color: deepTealColor,
                                       name: "Deep Teal",
                                       description: "TThis is a detailed description for Deap Teal color")
        
    static var catalinaBlue = ColorElement(color: catalinaBlueColor,
                                           name: "Catalina Blue",
                                           description: "This is a detailed description for Catalina Blue color")
        
    static var darkIndingo = ColorElement(color: darkIndingoColor,
                                          name: "Dark Indingo",
                                          description: "This is a detailed description for Dark Indingo color")
    
    
    static var ripePlum = ColorElement(color: ripePlumColor,
                                       name: "Ripe Plum",
                                       description: "This is a detailed description for Ripe Plum color")

    static var mulberryWood = ColorElement(color: mulberryWoodColor,
                                           name: "Mulberry Wood",
                                           description: "This is a detailed description for Mulberry Wood color")

    static var kenyanCopper = ColorElement(color: kenyanCopperColor,
                                            name: "Kenyan Copper",
                                           description: "This is a detailed description for Kenyan Copper color")

    static var chestnut = ColorElement(color: chestnutColor,
                                       name: "Chestnut",
                                       description: "This is a detailed description for Chestnut color")
    
    
    

}
