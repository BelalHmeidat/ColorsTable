//
//  ColorsViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit

class ColorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet var descriptionLb: UILabel!
    
    @IBOutlet var descriptionLbTitle: UILabel!
    
    
    override func viewDidLoad() {
        title = "Colors"
        super.viewDidLoad()

    }
    //seeting the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ColorsData.colorsCount //number of rows depend on the number of colors in the colors controller
       }
   //setting contents for each row (cell bg color and cell color name)
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else{
           return UITableViewCell()
       }
       let color = ColorElement.colorElements[indexPath.row].color
       cell.backgroundColor = color
       let label : UILabel = cell.contentView.viewWithTag(1)! as! UILabel //fetching the label with subview tag
       label.text = ColorElement.colorElements[indexPath.row].name
       label.textColor = .white
       return cell
       
   }
    //when row is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colorDetailView : UIView = view.viewWithTag(2)! //fetching the color detail view with subview tag
        colorDetailView.backgroundColor = ColorsData.colorElements[indexPath.row].color
        descriptionLb.text = ColorsData.colorElements[indexPath.row].desc
        descriptionLb.textColor = .white
        descriptionLbTitle.textColor = .white
        
    }
    
    
   
    
    

}
