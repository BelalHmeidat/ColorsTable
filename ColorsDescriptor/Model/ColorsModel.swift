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
    private(set) var color : UIColor
    private(set) var name : String
    private(set) var description : String
    
    //MARK: Constructor
    init(color: UIColor, name: String, description: String) {
        self.color = color
        self.name = name
        self.description = description
    }
}
