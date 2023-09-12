//
//  ColorsViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit

class ColorsViewController: UIViewController{
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private var colorDetailsView: UIView!
    
    @IBOutlet private var descriptionLb: UILabel!
    @IBOutlet private var descriptionLbTitle: UILabel!

    //MARK: on start
    override func viewDidLoad() {
        title = "Colors"
        colorDetailsView.backgroundColor = ColorManager.colorManager.getColorElements()[0].color
        tableView.register(UINib(nibName: "ColorTableViewCell", bundle: nil), forCellReuseIdentifier: "ColorTableViewCell")
        super.viewDidLoad()
    }
}

// MARK: - Table View Delegate, Data Source, and functionalites
extension ColorsViewController : UITableViewDelegate, UITableViewDataSource{
    //setting the number of rows
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  ColorManager.colorManager.getColorElements().count //number of rows depend on the number of colors in the colors controller
   }
    
   //setting contents for each row (cell bg color and cell color name)
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell") as? ColorTableViewCell else{
           return UITableViewCell()
       }
       let color =  ColorManager.colorManager.getColorElements()[indexPath.row]
       cell.setup(with: color)
       return cell
   }
    
    //when row is clicked action
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorDetailsView.backgroundColor =  ColorManager.colorManager.getColorElements()[indexPath.row].color
        descriptionLb.text =  ColorManager.colorManager.getColorElements()[indexPath.row].desc
    }


}
