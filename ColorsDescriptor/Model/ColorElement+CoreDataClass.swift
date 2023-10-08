//
//  ColorElement+CoreDataClass.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 10/2/23.
//
//

import Foundation
import CoreData
import UIKit

@objc(ColorElement)
public class ColorElement: NSManagedObject {
    
    //MARK: Constructor
    /// Constructor from UI color when adding from the add color view
    /// - Parameters:
    ///   - color: the color selected from the color picker
    ///   - name: the name of the color in the list
    ///   - description: the description of the color to be viewed in the detail view
    ///   - context: the context the color will be saved to in core data
    convenience init(color: UIColor, name: String, description: String, context: NSManagedObjectContext) {
            let entity = NSEntityDescription.entity(forEntityName: "ColorElement", in: context)!
            self.init(entity: entity, insertInto: context)
        self.value = Int64(color.convertToValue())
            self.name = name
            self.desc = description
            self.markedForDeletion = false
            self.index = -1
        }
    /// Constructor from int value when adding from code
    /// See constructor above
    convenience init(color: Int, name: String, description: String, context: NSManagedObjectContext) {
            let entity = NSEntityDescription.entity(forEntityName: "ColorElement", in: context)!
            self.init(entity: entity, insertInto: context)
        self.value = Int64(color)
            self.name = name
            self.desc = description
            self.markedForDeletion = false
            self.index = -1

        }
}
