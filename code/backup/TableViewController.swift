//
//  TableViewController.swift
//  Pronzo
//
//  Created by Surya Ruddaraju on 4/19/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

struct cellData {
    let name : String!
    let image : UIImage!
    let interest : String!
    let time : String!
    let location : String!
}

class TableViewController: UITableViewController {
    
    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        
        self.tabBarController?.tabBar.isHidden = false
        
        arrayOfCellData = [cellData(name: "Surya", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.31 PM"), interest: "Java", time:
                                    "1:00 PM", location: "Pizza My Heart"),
                           cellData(name: "Roy", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.17 PM"), interest: "Swift", time:
                                    "2:00 PM", location: "Kianti's"),
                           cellData(name: "Shanee", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.04 PM"), interest: "C", time:
                                    "3:00 PM", location: "Taqueria Los Pericos"),
                           cellData(name: "Dean", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.22 PM"), interest: "C++", time:
                                    "4:00 PM", location: "Taqueria Vallarta"),
                           cellData(name: "Alex", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.24 PM"), interest: "Python", time:
                                    "5:00 PM", location: "El Palomar"),
                           cellData(name: "Surya", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.31 PM"), interest: "Java", time:
                                    "1:00 PM", location: "Cafe Mare"),
                           cellData(name: "Roy", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.17 PM"), interest: "Swift", time:
                                    "2:00 PM", location: "Santa Cruz Diner"),
                           cellData(name: "Shanee", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.04 PM"), interest: "C", time:
                                    "3:00 PM", location: "Woodstock's Pizza"),
                           cellData(name: "Dean", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.22 PM"), interest: "C++", time:
                                    "4:00 PM", location: "Sawasdee by the Sea"),
                           cellData(name: "Alex", image: #imageLiteral(resourceName: "Screen Shot 2017-04-19 at 3.57.24 PM"), interest: "Python", time:
                                    "5:00 PM", location: "Sabieng")]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("EventTableViewCell", owner: self, options: nil)?.first as! EventTableViewCell
        
        cell.picture.image = arrayOfCellData[indexPath.row].image
        cell.name.text = arrayOfCellData[indexPath.row].name
        cell.intrests.text = arrayOfCellData[indexPath.row].interest
        cell.time.text = arrayOfCellData[indexPath.row].time
        cell.location.text = arrayOfCellData[indexPath.row].location
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "eventDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("in segue")
        if segue.identifier == "eventDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = arrayOfCellData[indexPath.row]
                NSLog("name: %@", object.name)
                let controller = (segue.destination as! UINavigationController).topViewController as!
                                                                                EventDetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    
}


