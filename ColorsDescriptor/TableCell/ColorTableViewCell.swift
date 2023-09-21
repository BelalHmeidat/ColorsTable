//
//  TableCell.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/31/23.
//

import Foundation
import UIKit


class ColorTableViewCell: UITableViewCell {
    //MARK: outlets
    //label inside each cell
    @IBOutlet var titleLabel: UILabel!
    
    //MARK: intitilization
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Functions
    /// sets up the cell's background color and the label inside depending the color element it takes as parameter
    /// - Parameter color: ColorElement object that has color details to be displayed in the cell as label and background color
    func setup(with color: ColorElement){
        let bgColor : Int = color.color
        titleLabel.text = color.name
        self.backgroundColor = UIColor(value: bgColor)
        titleLabel.textColor = .white
    }
}
