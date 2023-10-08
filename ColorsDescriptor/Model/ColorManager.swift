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
    
    //MARK: Functions
    
    /// getter for the color elements list
    /// - Returns: the list of colors in ColorManager called colorElements
    func getColorElements() -> [ColorElement]{
        do{
            colorElements = try ColorManager.context.fetch(ColorElement.fetchRequest())
            colorElements = orderColors()
            } catch {
                setColorIndecies() /// if first time run then the indecies will be set to the default list
            }
        return self.colorElements
    }
    /// Function to save the color list to the core data context with correct order
    ///  Called after deletion, addition, and edit
    func saveColorList() {
        do {
            setColorIndecies() /// updates the index to the index of the list to be fetched later from core data and reordered
            try ColorManager.context.save()
            colorElements = getColorElements() /// updating the list used to reload the tableview data
        }
        catch{
        }
    }
    /// function that clears selected colors for deletion, called after edit is done
    func resetSelectedColors() {
        for color in colorElements {
            color.markedForDeletion = false
        }
    }
    
    /// Goes over all the colors and deletes the one marked for deletion
    func deleteSelectedColors(){
        for color in colorElements {
            if color.markedForDeletion {
                ColorManager.context.delete(color)
            }
        }
        /// Saves the color
        saveColorList()
    }
    
    /// Checks if any of the colors have been marked for deletion to decide whether the trash icon is enabled or not
    /// - Returns: boolean value that is true if the any of the colors is marked for deletion
    func checkDelete() -> Bool{
        for color in colorElements {
            if color.markedForDeletion {
                return true
            }
        }
        return false
    }
    
    
    /// Adds a color object to the data core context
    /// - Parameter color: the color to be added
    func addElement(color : ColorElement){
        ColorManager.context.insert(color)
    }
    
    /// goes over the color elements in the stored list of colors and updates each of their index property to match their actual index in the list
    /// Called when saving to core data context after deletion, addition, or edit
    func setColorIndecies(){
        for (i, color) in colorElements.enumerated(){
            color.index = i
        }
    }
    
    /// Orders the colors in the list depending on the color index property for each color
    /// - Returns: an ordered color list
    func orderColors() -> [ColorElement]{
        let list =  colorElements.sorted{$0.index < $1.index}
//        for color in colorElements {
//            print(color.name, color.index)
//        }
        return list
    }
    /// Moves elements corresponding to moving of elements in the colors view controller
    /// - Parameters:
    ///   - sourceIndexPath: the old position of the element to be moved in the list
    ///   - destinationIndexPath: the new position
    func moveElement(_ sourceIndexPath: IndexPath, _ destinationIndexPath: IndexPath) {
        let sourceObjectHolder = ColorManager.shared.colorElements[sourceIndexPath.row]
        ColorManager.shared.colorElements.remove(at: sourceIndexPath.row)
        ColorManager.shared.colorElements.insert(sourceObjectHolder, at: destinationIndexPath.row)
    }
}


