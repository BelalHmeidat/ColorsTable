//
//  TextfieldValidator.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/27/23.
//

import Foundation

class Validator {
    func isColorTitleValid(_ value: String) -> String?{
        if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            return "Title is required"
        }
        else if value.count > 20{
            return "Title is too long"
        }
        return nil
    }
    
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
    
    func isColorDescriptionValid(_ value: String) -> String?{
        if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            return "Description is required"
        }
        return nil
    }
}
