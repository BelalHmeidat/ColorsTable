//
//  ColorsViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit
import CoreData

class ColorsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet private(set) weak var tableView: UITableView!
    @IBOutlet private(set) var colorDetailsView: UIView!
    @IBOutlet private(set) var descriptionLb: UILabel!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var trashColorButton: UIBarButtonItem!
    
    static var globalTableView : ColorsViewController?
    
    //MARK: constants
    let cellIdentifier = "ColorTableViewCell"
    

    //MARK: initilizing view
    
    override func viewDidLoad() {
        ColorsViewController.globalTableView = self
        setupView()
        super.viewDidLoad()
    }
    
    private func setupView(){
        title = "Colors"
        colorDetailsView.backgroundColor = ColorManager.shared.defaultColor
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
//        toolbar.isHidden = true
        trashColorButton.isEnabled = false
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "AddColorSegue" {
           let detailVC = segue.destination as! AddColorViewController
           detailVC.delegate = self // Set the delegate to the table view controller
        }
    }
    
    // Function to animate the toolbar sliding up or down
    func toggleToolbarVisibility(show : Bool) {
        /// Added 10 so toolbar buttons don't get clipped at corners
        let toolbarHeight = -1 * (self.toolbar.frame.size.height + 10)
        let yOffset: CGFloat = !show ? 0.0 : toolbarHeight
        UIView.animate(withDuration: 0.2) {
            self.toolbar.transform = CGAffineTransform(translationX: 0, y: yOffset)
            self.view.layoutIfNeeded()
        }
    }
    /// updates the color so that the removed color detail is never shown afer deletion
    private func updateSelectedColor() {
        colorDetailsView.backgroundColor = UIColor(value: Int(ColorManager.shared.colorElements[0].value))
        descriptionLb.text = ColorManager.shared.colorElements[0].desc
    }
    
    //MARK: Button Actions
    @IBAction private func editButtonAction(_ sender: UIBarButtonItem) {
        /// Toggles editing mode for the table
        tableView.isEditing.toggle()
        /// Enables the toolbar for delete and add while in edit mode
        toggleToolbarVisibility(show: tableView.isEditing)
        if (tableView.isEditing == true){
            editButton.title = "Done"
        }
        else {
            editButton.title = "Edit"
            ColorManager.shared.saveColorList()
            trashColorButton.isEnabled = false
        }
        ColorManager.shared.resetSelectedColors()
        /// Updates the data in the table
        tableView.reloadData()
    }
    
    @IBAction private func deleteButtonAction(_ sender: UIBarItem) {
        ColorManager.shared.deleteSelectedColors()
        /// Updates the selected color for the detail view to the color of the first element when a color is deleted
        updateSelectedColor()
        tableView.reloadData()
        updateTrashButtonState()
    }
    
    //MARK: functions
    /// Toggles between enabled trash button (when there are cells selected) and disabled trash button
    func updateTrashButtonState(){
        trashColorButton.isEnabled = ColorManager.shared.checkDelete()
    }
}
