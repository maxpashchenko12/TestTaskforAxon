//
//  headerCellAvatar.swift
//  TestTask
//
//  Created by mac on 18.09.2018.
//  Copyright © 2018 SharedWork. All rights reserved.
//

import UIKit
import Alamofire

class headerCellAvatar: UITableViewHeaderFooterView {

   
    @IBOutlet weak var avatarImageInformationView: UIImageView!
    @IBOutlet weak var firstNameInformLabel: UILabel!
    @IBOutlet weak var secondNameInformLabel: UILabel!
    

    
    var informTableView = InformationTableViewController()
    
    func configureHeader(with firstName: String, lastName: String, avatarImage: String) {
        
        self.firstNameInformLabel.text = firstName
        self.secondNameInformLabel.text = lastName
        
        let radius = avatarImageInformationView.frame.width / 2
        avatarImageInformationView.layer.cornerRadius = radius
        avatarImageInformationView.layer.masksToBounds = true
        
        
        
        let imageURL = URL(string: avatarImage)!
        URLSession.shared.dataTask(with: imageURL) { (data, _, _) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.avatarImageInformationView.image = image
                }
            }
            }.resume()
        
        
        
        
        
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
