//
//  ColorElement+CoreDataProperties.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 10/2/23.
//
//

import Foundation
import CoreData


extension ColorElement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ColorElement> {
        return NSFetchRequest<ColorElement>(entityName: "ColorElement")
    }

    @NSManaged public var value: Int64
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var markedForDeletion : Bool

}

extension ColorElement : Identifiable {

}
