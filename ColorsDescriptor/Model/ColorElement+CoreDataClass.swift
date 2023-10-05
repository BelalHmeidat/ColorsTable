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
//        init(color: Int, name: String, description: String,entity: NSEntityDescription, context: NSManagedObjectContext? ) {
//            super.init(entity: entity, insertInto: context)
//            self.value = Int64(color)
//            self.name = name
//            self.desc = description
//        }
    
    convenience init(color: UIColor, name: String, description: String, context: NSManagedObjectContext) {
            let entity = NSEntityDescription.entity(forEntityName: "ColorElement", in: context)!
            self.init(entity: entity, insertInto: context)
        self.value = Int64(color.convertToValue())
            self.name = name
            self.desc = description
            self.markedForDeletion = false
            self.index = -1
        }
    
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
