//
//  SignUpViewController.swift
//  Pronzo
//
//  Created by Roy Shadmon on 5/4/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet var Email: UITextField!
    @IBOutlet var Username: UITextField!
    @IBOutlet var Password: UITextField!
    
    @IBAction func SignUpButton(_ sender: Any) {
        if Email.text == "" {
            let alertController = UIAlertController(title: "Sign up error", message: "Please enter an email", preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
        else {
            FIRAuth.auth()?.createUser(withEmail: Email.text!, password: Password.text!){
                (user, error) in
                if error == nil {
                    print("Thanks for signing up!")
                    
                }
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
        }
        
    }
       
    

    
}
