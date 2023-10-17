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
    @IBOutlet private weak var colorTitleTextField: UITextField!
    @IBOutlet private weak var colorDescTextView: UITextView!
    @IBOutlet private weak var chooseColorBt: UIButton!
    
    //MARK: Delegate
    weak var delegate : (AddColorViewControllerDelegate)?
    
    //MARK: Function
    fileprivate func addPaddingToTextfield() {
        let paddingView = UIView(frame: CGRectMake(0, 0, 15, self.colorTitleTextField.frame.height))
        colorTitleTextField.leftView = paddingView
        colorTitleTextField.leftViewMode = UITextField.ViewMode.always
        colorTitleTextField.rightView = paddingView
        colorTitleTextField.rightViewMode = UITextField.ViewMode.always
    }
    
    private func setupBorders() {
        
    ///Title Textfield Setup
    colorTitleTextField.clipsToBounds = true ///Needed for the rounded corners
    colorTitleTextField.layer.cornerRadius = 13
    colorTitleTextField.layer.borderWidth = 1
    colorTitleTextField.layer.borderColor = UIColor.lightGray.cgColor
    addPaddingToTextfield()

    ///Description Textview Setup
    colorDescTextView.layer.borderColor = UIColor.lightGray.cgColor
    colorDescTextView.layer.borderWidth = 1
    colorDescTextView.layer.cornerRadius = 20
    colorDescTextView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }
    /// When the color is selected, the color button add view is updated to match the selected color
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        chooseColorBt.tintColor = color
    }
    
    //MARK: Initilization
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBorders()
    }
    
    //MARK: Outlet functions
    private func showAlert(_ error: String?) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert,animated: true)
    }
    
    /// validates the input information of the color to be added and adds it to the list of color then saves it to the context of data core
    /// Closes of the view and returns back to the colors view
    @IBAction private func addColorPressed(_ sender: UIButton) {
        let colorTitle = colorTitleTextField.text!
        let colorDesc = colorDescTextView.text!
        let alertMessage = Validator.isColorValid(title: colorTitle, description: colorDesc, color: chooseColorBt.tintColor)
        if alertMessage != nil {
            showAlert(alertMessage)
            return
        }
        ColorElement(color: chooseColorBt.tintColor, name: colorTitle, description: colorDesc)
        ColorManager.shared.saveColorList()
        self.dismiss(animated: true, completion: {self.delegate?.actionRequiresReloadPerformed()}) //closing view controller
    }
    
    private func openColorPickerView() {
        let colorPickerViewController = UIColorPickerViewController()
        colorPickerViewController.delegate = self
        colorPickerViewController.supportsAlpha = false /// no opacity for colors
        present(colorPickerViewController, animated: true)
    }
    
    /// Pressing the color button shows a color picker view
    @IBAction private func colorButtonPressed(_ sender: UIButton) {
        openColorPickerView()
    }
    /// Dismisses the add color view and returns to the colors view
    @IBAction private func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
