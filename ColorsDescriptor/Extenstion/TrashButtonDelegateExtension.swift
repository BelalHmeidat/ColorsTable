//
//  TrashButtonDelegateExtension.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 10/24/23.
//

import Foundation

/// delegate extension to refresh the table data after adding a color action is performed in the AddColoViewController
extension ColorsViewController : ColorTableCellDelegate {
    func updateTrashButton(index : Int) -> Bool{
        ColorManager.shared.colorElements[index].markedForDeletion.toggle() //marks the object for deletio
        updateTrashButtonState()
        return isMarkedForDeletion(index: index)
    }
    func isMarkedForDeletion(index: Int) -> Bool {
        return ColorManager.shared.colorElements[index].markedForDeletion
    }
}
