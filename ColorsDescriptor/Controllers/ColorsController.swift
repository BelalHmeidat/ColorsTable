//
//  ColorsData.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit
// struct to contain colors and their descriptions
struct ColorElement {
    
    //MARK: Properties
    private var _color : UIColor
    private var _name : String
    private var _description : String
    
    //MARK: Constructor
    init(color: UIColor, name: String, description: String) {
        self._color = color
        self._name = name
        self._description = description
//        ColorElement.colorElements.append(self)
    }
    
    
    //MARK: getters
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
