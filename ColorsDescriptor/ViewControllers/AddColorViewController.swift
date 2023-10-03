//
//  AddColorViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/21/23.
//

import UIKit

protocol AddColorViewControllerDelegate : AnyObject {
    func actionRequiresReloadPerformed()
}

class AddColorViewController: UIViewController, UIColorPickerViewControllerDelegate {

    //MARK: Outlets
    @IBOutlet weak var colorTitleTextField: UITextField!
    @IBOutlet weak var colorDescTextView: UITextView!
    @IBOutlet weak var chooseColorBt: UIButton!
    
    //MARK: Global
    var selectedColor : UIColor?
    var colorTitle : String?
    var colorDesc : String?
    
    //MARK: Delegate
    weak var delegate : (AddColorViewControllerDelegate)?
    
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
    
    @IBAction func addColorPressed(_ sender: UIButton) {
        colorTitle = colorTitleTextField.text!
        colorDesc = colorDescTextView.text!
        let newColorElement = ColorElement(color: selectedColor ?? chooseColorBt.tintColor, name: colorTitle!, description: colorDesc!, context: ColorManager.context)
        if Validator().isColorTitleValid(colorTitle!) != nil {
            let alert = UIAlertController(title: "Error", message: Validator().isColorTitleValid(colorTitle!), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert,animated: true)
            return
        }
        else if Validator().isColorElementValid(newColorElement) != nil{
            let alert = UIAlertController(title: "Error", message: Validator().isColorElementValid(newColorElement), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert,animated: true)
            return
        }
        else if Validator().isColorTitleValid(colorDesc!) != nil {
            let alert = UIAlertController(title: "Error", message: Validator().isColorDescriptionValid(colorDesc!), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert,animated: true)
            return
        }

        ColorManager.shared.colorElements.append(newColorElement)
//        ColorManager.shared.saveColorList()
        self.dismiss(animated: true, completion: {self.delegate?.actionRequiresReloadPerformed()}) //closing view controller
//        delegate?.actionRequiresReloadPerformed()
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        let colorPickerViewController = UIColorPickerViewController()
        colorPickerViewController.delegate = self
        colorPickerViewController.supportsAlpha = false //can
        present(colorPickerViewController, animated: true)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        selectedColor = color
        chooseColorBt.tintColor = selectedColor
    }
}
