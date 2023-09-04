//
//  TableCell.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/31/23.
//

import Foundation
import UIKit


class ColorTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with color: ColorElement){
        let bgColor = color.color
        titleLabel.text = color.name
        contentView.backgroundColor = bgColor
        titleLabel.textColor = .white
    }
    
}
