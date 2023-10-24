//
//  TableCell.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/31/23.
//

import Foundation
import UIKit

protocol TrashButtonAccessDelegate : AnyObject {
    func updateTrashButton()
}

class ColorTableViewCell: UITableViewCell {
    //MARK: outlets
    //label inside each cell
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
    
    static weak private var delegate : TrashButtonAccessDelegate?
    

    
    //MARK: static
    static var selectedColorsIndecies : [Int] = []
    
    //MARK: global vars
    var colorIndex : Int = -1 //used to when setting up the cell. It stores the index of the color the cell stores

    
    
    //MARK: intitilization
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Functions
    /// sets up the cell's background color and the label inside depending the color element it takes as parameter
    /// - Parameter color: ColorElement object that has color details to be displayed in the cell as label and background color
    func setup(with color: ColorElement, index: Int, editing: Bool){
        let bgColor : Int = Int(color.value)
        titleLabel.text = color.name
        self.backgroundColor = UIColor(value: bgColor)
        titleLabel.textColor = .white
        colorIndex = index
        checkboxButton.isHidden = false
        if !editing {
            checkboxButton.isHidden = true
        }
        // checking if the cell is checked here is neccessary becuase of the dequeable property of the cell
        else {
            updateImage(reverse: true)
        }
    }
    
    /// Changes between checked and unchecked image
    /// - Parameter reverse: reverses the action of the function
    private func updateImage(reverse : Bool) {
        var isSelected = ColorManager.shared.colorElements[colorIndex].markedForDeletion 
        if !reverse {
            isSelected = !isSelected
        }
        checkboxButton.setImage(UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle")!.withTintColor(.white, renderingMode:.alwaysOriginal), for: .normal)
    }
    //MARK: Outlet functions
    /// Update the check symbol to the left of the cell each time it's tapped to indicate if the cell is selected or not
    @IBAction func checkboxButtonTapped(_ sender: UIButton) {
        updateImage(reverse: false)
        ColorManager.shared.colorElements[colorIndex].markedForDeletion.toggle() //marks the object for deletion
        ColorTableViewCell.delegate?.updateTrashButton()
    }
    
    /// Changes the color of the reorder control handle to white to make it more visible
    /// control handle is subview of type UIImageView which can be accessed by the "UITableViewCellReorderControl" description
    /// after fetching it the image for the reorder control handle can be extracted and its tini color can be changed to desired color (white in this case)
    /// credit: https://stackoverflow.com/a/56646864/15690748
    // FIXME: color of the handle for a cell reverts to default after reordering that cell
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        for subViewA in self.subviews {
            if (subViewA.classForCoder.description() == "UITableViewCellReorderControl") {
                for subViewB in subViewA.subviews {
                    if (subViewB.isKind(of: UIImageView.classForCoder())) {
                        let imageView = subViewB as! UIImageView;
                        let myImage = imageView.image;
                        imageView.image = myImage?.withRenderingMode(.alwaysTemplate);
                        imageView.tintColor = .white
                        break;
                    }
                }
                break;
            }
        }
    }
}
