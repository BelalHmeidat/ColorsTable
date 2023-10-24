//
//  TrashButtonDelegateExtension.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 10/24/23.
//

import Foundation

/// delegate extension to refresh the table data after adding a color action is performed in the AddColoViewController
extension ColorsViewController : TrashButtonAccessDelegate {
    func updateTrashButton() {
        updateTrashButtonState()
    }
}
