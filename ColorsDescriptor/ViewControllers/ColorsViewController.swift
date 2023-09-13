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
    
   
    //MARK: constants
    private let cellIdentifier = "ColorTableViewCell"
    
    //MARK: global vars
    var colorList = ColorManager.shared.getColorElements()

    //MARK: initilizing view
    private func setupView(){
        title = "Colors"
        colorDetailsView.backgroundColor = ColorManager.shared.getColorElements()[0].color
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()
    }
    
    //MARK: Button Actions
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
        if (tableView.isEditing == true){
            editButton.title = "Done"
        }
        else {
            editButton.title = "Edit"
            ColorManager.shared.setColorElements(colors: colorList)
            ColorManager.debugListOrder()

        }
    }
}

// MARK: - Table View Delegate, Data Source, and functionalites
extension ColorsViewController : UITableViewDelegate, UITableViewDataSource {
    //setting the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  ColorManager.shared.getColorElements().count //number of rows depend on the number of colors in the colors controller
   }
    
   //setting contents for each row (cell bg color and cell color name)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ColorTableViewCell else{
           return UITableViewCell()
       }
       let color =  ColorManager.shared.getColorElements()[indexPath.row]
       cell.setup(with: color)
       return cell
   }
    //enabling moving cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    //hiding delete buttons
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    //removing delete button identation
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    //reflecting changes to the list of color elements
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let holdVal = colorList[sourceIndexPath.row]
        colorList.remove(at: sourceIndexPath.row)
        colorList.insert(holdVal, at: destinationIndexPath.row)
    }
    //when row is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorDetailsView.backgroundColor =  ColorManager.shared.getColorElements()[indexPath.row].color
        descriptionLb.text =  ColorManager.shared.getColorElements()[indexPath.row].description
    }
}
