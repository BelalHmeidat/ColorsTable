//
//  AddColorViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/21/23.
//

import UIKit

class AddColorViewController: UIViewController, UIColorPickerViewControllerDelegate {

    //MARK: Outlets
    @IBOutlet weak var colorTitleTextField: UITextField!
    @IBOutlet weak var colorDescTextView: UITextView!
    @IBOutlet weak var addColorButton: UIButton!
    
    //MARK: Function
    fileprivate func setupBorders() {
        colorDescTextView.layer.borderColor = UIColor.lightGray.cgColor
        colorDescTextView.layer.borderWidth = 1
        colorDescTextView.layer.cornerRadius = 10
        colorTitleTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    //MARK: Initilization
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBorders()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        let colorPickerViewController = UIColorPickerViewController()
        colorPickerViewController.delegate = self
        colorPickerViewController.supportsAlpha = false //can
        present(colorPickerViewController, animated: true)
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        addColorButton.tintColor = color
    }
}
