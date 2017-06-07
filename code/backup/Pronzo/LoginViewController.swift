//
//  LoginViewController.swift
//  Pronzo
//
//  Created by Roy Shadmon on 5/11/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var Password: UITextField!
    @IBOutlet var Email: UITextField!
    @IBAction func loginAction(_ sender: AnyObject) {
        if Email.text == "" || Password.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            FIRAuth.auth()?.signIn(withEmail: self.Email.text!, password: self.Password.text!) { (user, error) in
                if error == nil {
                    print("You have successfully logged in!")
                                    }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Click Login", style: UIAlertActionStyle.default, handler: nil))

                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

}
