//
//  TableCell.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/31/23.
//

import Foundation
import UIKit


class ColorTableViewCell: UITableViewCell {
    
    //MARK: cell content outlets
    @IBOutlet var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: cell content setup
    func setup(with color: ColorElement){
        let bgColor = color.color
        titleLabel.text = color.name
        self.backgroundColor = bgColor
        titleLabel.textColor = .white
    }
    
}
