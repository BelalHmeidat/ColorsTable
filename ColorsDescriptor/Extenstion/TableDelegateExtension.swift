//
//  Extensions.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/20/23.
//

import Foundation
import UIKit


// MARK: - Table View Delegate, Data Source, and functionalites
extension ColorsViewController : UITableViewDelegate, UITableViewDataSource {
    /// setting the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ColorManager.shared.colorElements.count
       /// number of rows depend on the number of colors in the colors controller
   }
    
    //MARK: cell content configuration
   /// setting contents for each row (cell bg color and cell color name)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ColorTableViewCell else{
           return UITableViewCell()
       }
        /// storing the bg color of the cell to be passed when building it
        let color =  ColorManager.shared.colorElements[indexPath.row]
        /// passing cell build parameters
        cell.setup(with: color, index:indexPath.row, editing: self.tableView.isEditing)
       return cell
        
   }
    //MARK: cell edit configuration
    ///reference: https://www.ralfebert.com/ios-examples/uikit/uitableviewcontroller/reorderable-cells/
    ///enabling moving cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    /// reflecting changes to the list of color elements as a result of moving cell
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        ColorManager.shared.moveElement(sourceIndexPath, destinationIndexPath)
        tableView.reloadData()
    }
    
    /// Disabling editing style becuase non is used
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    /// disabling Identation because it's done manually through ColorTableViewCell
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //MARK: cell action configuration
    /// Action to be performed when a table cell is clicked
    /// Sets the bottom view backgroud color to the color of the cell and shows a description of that color
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorDetailsView.backgroundColor =  UIColor(value: Int(ColorManager.shared.colorElements[indexPath.row].value))
        descriptionLb.text =  ColorManager.shared.colorElements[indexPath.row].desc
    }
}
