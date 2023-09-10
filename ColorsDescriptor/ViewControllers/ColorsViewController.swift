//
//  ColorsViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit

class ColorsViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var colorDetailsView: UIView!
    @IBOutlet var descriptionLb: UILabel!
    @IBOutlet var descriptionLbTitle: UILabel!
    
    override func viewDidLoad() {
        title = "Colors"
        colorDetailsView.backgroundColor = ColorManager.colorManager.getColorElements()[0].color
        tableView.register(UINib(nibName: "ColorTableViewCell", bundle: nil), forCellReuseIdentifier: "ColorTableViewCell")
        super.viewDidLoad()
    }
}

extension ColorsViewController : UITableViewDelegate, UITableViewDataSource{
    //setting the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  ColorManager.colorManager.getColorElements().count //number of rows depend on the number of colors in the colors controller
   }
    
   //setting contents for each row (cell bg color and cell color name)
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell") as? ColorTableViewCell else{
           return UITableViewCell()
       }
       let color =  ColorManager.colorManager.getColorElements()[indexPath.row]
       cell.setup(with: color)
       return cell
   }
    
    //when row is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorDetailsView.backgroundColor =  ColorManager.colorManager.getColorElements()[indexPath.row].color
        descriptionLb.text =  ColorManager.colorManager.getColorElements()[indexPath.row].desc
    }


}
