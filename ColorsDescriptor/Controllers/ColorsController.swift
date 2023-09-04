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
