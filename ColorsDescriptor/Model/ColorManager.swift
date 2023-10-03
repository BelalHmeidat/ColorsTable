//
//  ColorManager.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/10/23.
//

import Foundation
import UIKit

//Has the color elements ordered list
class ColorManager{
    //MARK: Sigleton
    //single instance of color manager
    static let shared = ColorManager()
    
    //MARK: Constants
    let colorElementsKey = "storedColorElements"
    let defaults = UserDefaults.standard
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    //MARK: vars
//    var selectedColors :IndexSet = []
    var defaultColor : UIColor = .white

    //MARK: temp
    //ordered color element list
    var colorElements = [
       ColorElement(color: 0x1E4C63,
                    name: "Deep Teal",
                    description: "TThis is a detailed description for Deap Teal color", context: context
                    ),
            
        ColorElement(color: 0x102D76,
                     name: "Catalina Blue",
                     description: "This is a detailed description for Catalina Blue color", context: context
                     ),
            
        ColorElement(color: 0x180B4F,
                      name: "Dark Indingo",
                     description: "This is a detailed description for Dark Indingo color", context: context
                     ),

        
        ColorElement(color: 0x3F1156,
                     name: "Ripe Plum",
                     description: "This is a detailed description for Ripe Plum color", context: context
                     ),

        ColorElement(color: 0x4E172A,
                   name: "Mulberry Wood",
                     description: "This is a detailed description for Mulberry Wood color", context: context
                    ),

       ColorElement(color: 0x781F0E,
                    name: "Kenyan Copper",
                    description: "This is a detailed description for Kenyan Copper color", context: context
                   ),

        ColorElement(color:  0x733010,
                   name: "Chestnut",
                     description: "This is a detailed description for Chestnut color", context: context
                    ),
        ]
    
    //MARK: Intilizer
    /// Rrivate initilizer for singleton.
    /// Retrieves colors list stored in user defaults if exists sets it as the color list to be displayed in the app
    private init() {
        do {
            let coreDataList = try ColorManager.context.fetch(ColorElement.fetchRequest())
            colorElements = coreDataList
//            colorElements = []
        }
        catch{}
        if colorElements.count != 0{
            defaultColor = UIColor(value: Int(colorElements[0].value))
        }
    }
    
    //MARK: getters
    /// getter for the color elements list
    /// - Returns: the list of colors in ColorManager called colorElements
    func getColorElements() -> [ColorElement]{
        do{
            colorElements = try ColorManager.context.fetch(ColorElement.fetchRequest())
            } catch {
            }
        return self.colorElements
    }
    
    //MARK: Functions
    /// function to save the ordered color list in the user defaults using JSON encoding
    func saveColorList() {
        do {
//            for color in try ColorManager.context.fetch(ColorElement.fetchRequest()) {
//                ColorManager.context.delete(color)
//            }
            try ColorManager.context.save()
        }
        catch{
        }
    }
    
    func resetSelectedColors() {
        for color in colorElements {
            color.markedForDeletion = false
        }
    }
    
    func deleteSelectedColors(){
        for color in colorElements {
            if color.markedForDeletion {
                ColorManager.context.delete(color) //<<<
                colorElements.remove(at: colorElements.firstIndex(of: color)!)
            }
        }
        resetSelectedColors()
//        saveColorList()
    }
    
    func checkDelete() -> Bool{
        for color in colorElements {
            if color.markedForDeletion {
                return true
            }
        }
        return false
    }
}


