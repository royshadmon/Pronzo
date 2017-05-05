//
//  EventDetailViewController.swift
//  Pronzo
//
//  Created by Surya Ruddaraju on 4/24/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet var myLabel: UILabel!
    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = myLabel {
                label.text = detail.name
            }
        }
    }
    
    func buttonTapped(){
        performSegue(withIdentifier: "BackToList", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Title"
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: cellData? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    
}

