//
//  TextfieldValidator.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/27/23.
//

import Foundation
/// Validators for the textfields in the add color view
class Validator {
    /// Checks if the name of the color to be put in the colors list is not empty and not too long (20 chars)
    /// - Parameter value: name of the color input
    /// - Returns: error message to be viewed in a dialog
    func isColorTitleValid(_ value: String) -> String?{
        if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            return "Title is required"
        }
        else if value.count > 20{
            return "Title is too long"
        }
        return nil
    }
    /// Checks if the color picked is not alreadty in the color list viewed in the table
    /// - Parameter value: picked color input
    /// - Returns: error message to be viewed in a dialog
    func isColorElementValid(_ value: ColorElement) -> String? {
        print(value.value)
        for color in ColorManager.shared.colorElements {
            print(color.value)
            if value.value == color.value{
                return "Color already exits in the table"
            }
        }
        return nil
    }
    /// Checks if the description of the color to be put in the colors detail view is not empty
    /// - Parameter value: description of the color input
    /// - Returns: error message to be viewed in a dialog
    func isColorDescriptionValid(_ value: String) -> String?{
        if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            return "Description is required"
        }
        return nil
    }
}
