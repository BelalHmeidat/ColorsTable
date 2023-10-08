////
////  ColorsToolBar.swift
////  ColorsDescriptor
////
////  Created by Belal Hmeidat on 9/18/23.
////
//
//import Foundation
//import UIKit
//
//
//class ColorsToolBar : UIToolbar {
//    
//    @IBOutlet weak var toolbarLabel: UIBarButtonItem!
//    @IBOutlet weak var colorsToolBar: ColorsToolBar!
//    
//    let customIidentifier = "ColorsToolBar"
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    
//    func setup(){
//        self.backgroundColor = .blue
//    }
//    
//    func initSubviews() {
//        
//        let nib = UINib(nibName: customIidentifier, bundle: nil)
//        awakeFromNib()
//
//        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
//                UIView else {fatalError("Unable to convert nib")}
//        
//        view.frame = bounds
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        
//        addSubview(view)
//        
//    }
//}
