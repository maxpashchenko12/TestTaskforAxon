//
//  TableViewController.swift
//  TestTask
//
//  Created by SharedWork on 09.09.2018.
//  Copyright © 2018 SharedWork. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ActorsListTableViewController: UITableViewController {
    
    var employees: NSArray = [[String:AnyObject]]() as NSArray
    let personJson: String = "person.json"
    var dataSourceArray = [Person]()
    var myIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.API()
    }
    
    private func readJSONObject(object: [String: AnyObject]){
        
        if let employees = object["employees"] as? [String: Any]{
            
            for (index, _) in employees.enumerated() {
                
                let personName = "person" + String.init(describing: index+1)
                if let currentPerson = employees[personName] as? [String: Any] {
                    
                    var person = Person()
                    person.firstName = currentPerson["firstName"] as! String
                    person.secondName = currentPerson["secondName"] as! String
                    person.avatar = currentPerson["avatar"] as! String
                    person.age = currentPerson["age"] as! Int
                    self.dataSourceArray.append(person)
                    
                }
                
            }
        }
        
        self.tableView.reloadData()
    }
    
    func API() {
        
        if let path = Bundle.main.path(forResource: "person", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                if let dictionary = object as? [String: AnyObject] {
                    readJSONObject(object: dictionary)
                    
                }
                
                
            } catch {
                // handle error
            }
            
        }
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataSourceArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActorsListTableViewCell
        
        cell.firstNameLabel.text = dataSourceArray[indexPath.row].firstName
        cell.secondNameLabel.text = dataSourceArray[indexPath.row].secondName
        
        let radius = cell.avatarImage.frame.width / 2
        cell.avatarImage.layer.cornerRadius = radius
        cell.avatarImage.layer.masksToBounds = true
    
        let urlString = dataSourceArray[indexPath.row].avatar
        let imageURL = URL(string: urlString)!
        URLSession.shared.dataTask(with: imageURL) { (data, _, _) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.avatarImage.image = image
                }
            }
            }.resume()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let controller = segue.destination as! InformationTableViewController
            controller.firstName = dataSourceArray[myIndex].firstName
            controller.secondName = dataSourceArray[myIndex].secondName
            controller.avatarImage = dataSourceArray[myIndex].avatar
            
            let ageString = "\(dataSourceArray[myIndex].age)"
            controller.agePerson = ageString
        }
        
    }
}





