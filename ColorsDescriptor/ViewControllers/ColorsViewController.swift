//
//  ColorsViewController.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 8/23/23.
//

import UIKit

class ColorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var colorDetailsView: UIView!
    @IBOutlet var descriptionLb: UILabel!
    @IBOutlet var descriptionLbTitle: UILabel!
    
    let colorElements = [
       ColorElement(color: UIColor(red: 30/255, green: 76/255, blue: 99/255.0, alpha: 1 ),
                                           name: "Deep Teal",
                                           description: "TThis is a detailed description for Deap Teal color"),
            
        ColorElement(color: UIColor(red: 16/255, green: 45/255, blue: 118/255, alpha: 1),
                                               name: "Catalina Blue",
                                               description: "This is a detailed description for Catalina Blue color"),
            
        ColorElement(color: UIColor(red: 24/255, green: 11/255, blue: 79/255, alpha: 1),
                                              name: "Dark Indingo",
                                              description: "This is a detailed description for Dark Indingo color"),
        
        
        ColorElement(color: UIColor(red: 63/255, green: 17/255, blue: 86/255, alpha: 1),
                                           name: "Ripe Plum",
                                           description: "This is a detailed description for Ripe Plum color"),

        ColorElement(color: UIColor(red: 78/255, green: 23/255, blue: 42/255, alpha: 1),
                                               name: "Mulberry Wood",
                                               description: "This is a detailed description for Mulberry Wood color"),

       ColorElement(color: UIColor(red: 120/255, green: 31/255, blue: 14/255, alpha: 1),
                                                name: "Kenyan Copper",
                                               description: "This is a detailed description for Kenyan Copper color"),

        ColorElement(color:  UIColor(red: 115/255, green: 48/255, blue: 16/255, alpha: 1),
                                           name: "Chestnut",
                                           description: "This is a detailed description for Chestnut color"),
        ]
    
    
    override func viewDidLoad() {
        title = "Colors"
        colorDetailsView.backgroundColor = colorElements[0].color
        descriptionLb.textColor = .white
        descriptionLbTitle.textColor = .white
        tableView.register(UINib(nibName: "ColorTableViewCell", bundle: nil), forCellReuseIdentifier: "ColorTableViewCell")
        super.viewDidLoad()

    }
    //setting the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorElements.count //number of rows depend on the number of colors in the colors controller
   }
   //setting contents for each row (cell bg color and cell color name)
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell") as? ColorTableViewCell else{
           return UITableViewCell()
       }
       let color = colorElements[indexPath.row]
       cell.setup(with: color)
//       NSLayoutConstraint.activate([
//           cell.widthAnchor.constraint(equalToConstant: 600)
//       ])
       return cell
       
   }
    //when row is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colorDetailView : UIView = view.viewWithTag(2)! //fetching the color detail view with subview tag
        colorDetailView.backgroundColor = colorElements[indexPath.row].color
        descriptionLb.text = colorElements[indexPath.row].desc
    }
    
   
    
    

}
