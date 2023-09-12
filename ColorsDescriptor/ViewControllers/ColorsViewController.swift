//
//  ColorsViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit

class ColorsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private var colorDetailsView: UIView!
    @IBOutlet private var descriptionLb: UILabel!
    
    //MARK: constants
    let cellIdentifier = "ColorTableViewCell"

    //MARK: initilizing view
    func setupView(){
        title = "Colors"
        colorDetailsView.backgroundColor = ColorManager.shared.getColorElements()[0].color
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()
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
    
    //when row is clicked action
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorDetailsView.backgroundColor =  ColorManager.shared.getColorElements()[indexPath.row].color
        descriptionLb.text =  ColorManager.shared.getColorElements()[indexPath.row].description
    }


}
