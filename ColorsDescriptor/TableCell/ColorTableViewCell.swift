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
    
    //MARK: global vars
    ///used to store the reorder control handle in the cell in order to change its color
    private var myReorderImage: UIImage? = nil
    
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
                        if (self.myReorderImage == nil) {
                            let myImage = imageView.image;
                            myReorderImage = myImage?.withRenderingMode(.alwaysTemplate);
                        }
                        imageView.image = self.myReorderImage;
                        imageView.tintColor = .white;
                        break;
                    }
                }
                break;
            }
        }
    }
}
