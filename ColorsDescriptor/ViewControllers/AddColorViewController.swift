//
//  AddColorViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/21/23.
//

import UIKit

class AddColorViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var colorTitleTextField: UITextField!
    @IBOutlet weak var colorDescTextView: UITextView!
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
