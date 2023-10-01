//
//  ColorsViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit

class ColorsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private var colorDetailsView: UIView!
    @IBOutlet private var descriptionLb: UILabel!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var trashColorButton: UIBarButtonItem!
    
    static var globalTableView : ColorsViewController?
  
    
    //MARK: constants
    private let cellIdentifier = "ColorTableViewCell"
    

    //MARK: initilizing view
    private func setupView(){
        title = "Colors"
        colorDetailsView.backgroundColor = ColorManager.shared.defaultColor
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
//        let toolbar = ColorsToolBar(frame: CGRect(x: 0, y: view.frame.maxY - 50, width: view.frame.width, height: 50))
//        view.addSubview(toolbar)
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
    
    //MARK: Button Actions
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        tableView.isEditing.toggle()
        toolbar.isHidden.toggle()
//        ColorTableViewCell.editingEnabled.toggle()
        if (tableView.isEditing == true){
            editButton.title = "Done"
        }
        else {
            editButton.title = "Edit"
        }
        ColorManager.shared.resetSelectedColors()
        tableView.reloadData()
    }
    @IBAction func deleteButtonAction(_ sender: UIBarItem) {
        ColorManager.shared.deleteSelectedColors()
        tableView.reloadData()
    }
    
    //MARK: functions
    func updateTrashButtonState(){
        trashColorButton.isEnabled = ColorManager.shared.checkDelete()
    }
}

// MARK: - Table View Delegate, Data Source, and functionalites
extension ColorsViewController : UITableViewDelegate, UITableViewDataSource {
    //setting the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  ColorManager.shared.getColorElements().count
       //number of rows depend on the number of colors in the colors controller
   }
    
    //MARK: cell content configuration
   //setting contents for each row (cell bg color and cell color name)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ColorTableViewCell else{
           return UITableViewCell()
       }
        let color =  ColorManager.shared.getColorElements()[indexPath.row]
        cell.setup(with: color, index:indexPath.row, editing: self.tableView.isEditing)
       return cell
        
   }
    //MARK: cell edit configuration
    ///reference: https://www.ralfebert.com/ios-examples/uikit/uitableviewcontroller/reorderable-cells/
    ///enabling moving cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    //reflecting changes to the list of color elements as a result of moving cells
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let holdVal = ColorManager.shared.colorElements[sourceIndexPath.row]
        ColorManager.shared.colorElements.remove(at: sourceIndexPath.row)
        ColorManager.shared.colorElements.insert(holdVal, at: destinationIndexPath.row)
        for (index, color) in ColorManager.shared.colorElements.enumerated() {
            print("\(index) \(color.name), \(color.markedForDeletion)")
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //MARK: cell action configuration
    /// Action to be performed when a table cell is clicked
    /// Sets the bottom view backgroud color to the color of the cell and shows a description of that color
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorDetailsView.backgroundColor =  UIColor(value: ColorManager.shared.getColorElements()[indexPath.row].color)
        descriptionLb.text =  ColorManager.shared.getColorElements()[indexPath.row].description
    }
}


extension ColorsViewController : AddColorViewControllerDelegate {
    func actionRequiresReloadPerformed() {
        tableView.reloadData()
    }
}

