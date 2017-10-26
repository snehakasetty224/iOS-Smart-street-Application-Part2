//
//  RegisterPageViewController.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 10/24/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextfField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButton(_ sender: Any) {
        let userEmail = emailTextField.text;
        let  password = passwordTextField.text;
        let repeatpassword = repeatPasswordTextfField.text;
        
        //check for empty field
        if((userEmail?.isEmpty)! || (password?.isEmpty)! || (repeatpassword?.isEmpty)!)
        {
            
            displayMyAlertMessage(userMessage: "All Fields are required");
            return;
        }
        if(password != repeatpassword)
        {
            displayMyAlertMessage(userMessage: "Passord do not Match");

            return;
        }
        
        // store Data
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(userEmail, forKey: "userEmail")
        defaults.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
    
        //displaying alert message with
        var myalert = UIAlertController(title: "alert", message: "Registration is successfull", preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default){ action in self.dismiss(animated: true, completion: nil);
            
        }
        myalert.addAction(okAction);
        self.present(myalert, animated:true, completion:nil);
        
    }
    
    func displayMyAlertMessage(userMessage: String)
    {
        var myalert = UIAlertController(title: "alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        
        myalert.addAction(okAction);
        
        self.present(myalert, animated:true, completion: nil);
    }
    

}
