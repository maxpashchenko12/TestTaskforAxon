//
//  InformationTableViewController.swift
//  TestTask
//
//  Created by mac on 17.09.2018.
//  Copyright © 2018 SharedWork. All rights reserved.
//

import UIKit
import Foundation

class InformationTableViewController: UITableViewController {
    
    var firstName: String!
    var secondName: String!
    var avatarImage: String!
    var agePerson: String!
    
    var firstTableViewController = ActorsListTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureViewController()
    }
    
    private func configureViewController(){
        
        let topHeaderView = UINib(nibName: "headerCellAvatar", bundle: nil)
        self.tableView.register(topHeaderView, forHeaderFooterViewReuseIdentifier: "headerCellAvatar")
        
        let titleHeaderView = UINib(nibName: "ViewHeaderInform", bundle: nil)
        self.tableView.register(titleHeaderView, forHeaderFooterViewReuseIdentifier: "ViewHeaderInform")
        
        
        let detailInformtionTableViewCell = UINib.init(nibName: "DetailTableViewCell", bundle: nil)
        self.tableView.register(detailInformtionTableViewCell, forCellReuseIdentifier: "informationCell")
        
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        self.tableView.estimatedSectionHeaderHeight = 25
        
        self.tableView.estimatedRowHeight = 44
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 0
        case 1:
            return 1
        case 2:
            return 1
        default:
            break
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            if let header = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerCellAvatar") as? headerCellAvatar {
                
                
                header.configureHeader(with: self.firstName, lastName: self.secondName, avatarImage: self.avatarImage)
                return header
            }
        } else {
            let header = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "ViewHeaderInform") as! ViewHeaderInform
            if section == 1 {
                header.configure(with: "Information")
            } else {
                header.configure(with: "No data")
            }
            return header
            
        }
        return UIView()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "informationCell", for: indexPath) as? DetailTableViewCell {
            
            cell.configure(with: self.firstName, secondName: self.secondName, age: self.agePerson, indexPath: indexPath)
            
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
