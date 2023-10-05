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
    var colorElements :[ColorElement] = []
    
    //MARK: Intilizer
    /// Rrivate initilizer for singleton.
    /// Retrieves colors list stored in user defaults if exists sets it as the color list to be displayed in the app
    private init() {
        colorElements = getColorElements()
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
            colorElements = orderColors()
            } catch {
                setColorIndecies() // if first time run then the indecies will be set to the default list
            }
        return self.colorElements
    }
    
    //MARK: Functions
    /// function to save the ordered color list in the user defaults using JSON encoding
    func saveColorList() {
        do {
//            for color in colorElements {
//               try ColorManager.context.delete(color)
//            }
            setColorIndecies()
            try ColorManager.context.save()
            colorElements = getColorElements() //updating the list used to reload the tableview data
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
            }
        }
        saveColorList()
    }
    
    func checkDelete() -> Bool{
        for color in colorElements {
            if color.markedForDeletion {
                return true
            }
        }
        return false
    }
    
    
    func addElement(color : ColorElement){
        ColorManager.context.insert(color)
    }
    
    func setColorIndecies(){
        for (i, color) in colorElements.enumerated(){
            color.index = i
            print(color.name, color.index)
        }
    }
    
    func orderColors() -> [ColorElement]{
        let list =  colorElements.sorted{$0.index < $1.index}
        for color in colorElements {
            print(color.name, color.index)
        }
        return list
    }
    func moveElement(_ sourceIndexPath: IndexPath, _ destinationIndexPath: IndexPath) {
        let sourceObjectHolder = ColorManager.shared.colorElements[sourceIndexPath.row]
        ColorManager.shared.colorElements.remove(at: sourceIndexPath.row)
        ColorManager.shared.colorElements.insert(sourceObjectHolder, at: destinationIndexPath.row)
    }
}


