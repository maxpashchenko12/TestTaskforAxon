//
//  DetailTableViewCell.swift
//  TestTask
//
//  Created by mac on 18.09.2018.
//  Copyright © 2018 SharedWork. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabelDetail: UILabel!
    @IBOutlet weak var secondNameDetail: UILabel!
    @IBOutlet weak var ageDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with firstName: String, secondName: String, age: String, indexPath: IndexPath){
        
        
        self.ageDetailLabel.text = age
        self.firstNameLabelDetail.text = firstName
        self.secondNameDetail.text = secondName
        
        
        
        
        
    }
    
}
