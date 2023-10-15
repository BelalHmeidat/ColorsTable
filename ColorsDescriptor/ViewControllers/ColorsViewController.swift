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
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private var colorDetailsView: UIView!
    @IBOutlet private var descriptionLb: UILabel!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var trashColorButton: UIBarButtonItem!
    
    static var globalTableView : ColorsViewController?
//    var container: NSPersistentContainer!
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ColorsListData")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }})
        return container
    }()
    
    //MARK: constants
    private let cellIdentifier = "ColorTableViewCell"
    

    //MARK: initilizing view
    private func setupView(){
        title = "Colors"
        colorDetailsView.backgroundColor = ColorManager.shared.defaultColor
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        toolbar.isHidden = true
        trashColorButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        ColorsViewController.globalTableView = self
        setupView()
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "AddColorSegue" {
           let detailVC = segue.destination as! AddColorViewController
           detailVC.delegate = self // Set the delegate to the table view controller
        }
    }
    
    // Function to animate the toolbar sliding up or down
    func toggleToolbarVisibility() {
        let toolbarHeight = self.toolbar.frame.size.height
        let yOffset: CGFloat = toolbar.isHidden ? -toolbarHeight : toolbarHeight

        UIView.animate(withDuration: 0.2) {
            self.toolbar.frame = self.toolbar.frame.offsetBy(dx: 0, dy: yOffset)
        }
        toolbar.isHidden.toggle()
    }
    /// updates the color so that the removed color detail is never shown afer deletion
    fileprivate func updateSelectedColor() {
        colorDetailsView.backgroundColor = UIColor(value: Int(ColorManager.shared.colorElements[0].value))
        descriptionLb.text = ColorManager.shared.colorElements[0].desc
    }
    
    //MARK: Button Actions
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        /// Toggles editing mode for the table
        tableView.isEditing.toggle()
        /// Enables the toolbar for delete and add while in edit mode
        toggleToolbarVisibility()
        if (tableView.isEditing == true){
            editButton.title = "Done"
        }
        else {
            editButton.title = "Edit"
            ColorManager.shared.saveColorList()
        }
        ColorManager.shared.resetSelectedColors()
        /// Updates the data in the table
        tableView.reloadData()
    }
    
    @IBAction func deleteButtonAction(_ sender: UIBarItem) {
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

// MARK: - Table View Delegate, Data Source, and functionalites
extension ColorsViewController : UITableViewDelegate, UITableViewDataSource {
    /// setting the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ColorManager.shared.colorElements.count
       /// number of rows depend on the number of colors in the colors controller
   }
    
    //MARK: cell content configuration
   /// setting contents for each row (cell bg color and cell color name)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ColorTableViewCell else{
           return UITableViewCell()
       }
        /// storing the bg color of the cell to be passed when building it
        let color =  ColorManager.shared.colorElements[indexPath.row]
        /// passing cell build parameters
        cell.setup(with: color, index:indexPath.row, editing: self.tableView.isEditing)
       return cell
        
   }
    //MARK: cell edit configuration
    ///reference: https://www.ralfebert.com/ios-examples/uikit/uitableviewcontroller/reorderable-cells/
    ///enabling moving cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    /// reflecting changes to the list of color elements as a result of moving cell
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        ColorManager.shared.moveElement(sourceIndexPath, destinationIndexPath)
        tableView.reloadData()
    }
    
    /// Disabling editing style becuase non is used
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    /// disabling Identation because it's done manually through ColorTableViewCell
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //MARK: cell action configuration
    /// Action to be performed when a table cell is clicked
    /// Sets the bottom view backgroud color to the color of the cell and shows a description of that color
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorDetailsView.backgroundColor =  UIColor(value: Int(ColorManager.shared.colorElements[indexPath.row].value))
        descriptionLb.text =  ColorManager.shared.colorElements[indexPath.row].desc
    }
}

/// delegate extension to refresh the table data after adding a color action is performed in the AddColoViewController
extension ColorsViewController : AddColorViewControllerDelegate {
    func actionRequiresReloadPerformed() {
        tableView.reloadData()
    }
}

