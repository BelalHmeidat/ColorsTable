//
//  ColorsToolBar.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/18/23.
//

import Foundation
import UIKit


class ColorsToolBar : UIToolbar {
    @IBOutlet weak var toolbarLabel: UIBarButtonItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(){
        self.backgroundColor = .blue
//        self.addSubview(UIButton())
        toolbarLabel.title = "Hello"
    }
}
