//
//  ViewHeaderInform.swift
//  TestTask
//
//  Created by mac on 18.09.2018.
//  Copyright © 2018 SharedWork. All rights reserved.
//

import UIKit

class ViewHeaderInform: UITableViewHeaderFooterView {
    
    @IBOutlet weak var informationLabel: UILabel!
    
    func configure(with title: String) {
        self.informationLabel.text = title
    }

    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
