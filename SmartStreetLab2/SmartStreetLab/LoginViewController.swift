//
//  LoginViewController.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 10/24/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailLoginTextfield: UITextField!
    @IBOutlet weak var passwordLogintextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        let userEmail = emailLoginTextfield.text;
        let password = passwordLogintextField.text;
        
        let defaults:UserDefaults = UserDefaults.standard
        //let e = UserDefaults(suiteName: "userEmail")
        let userEmailstore = defaults.string(forKey: "userEmail")
        let passwordStore = defaults.string(forKey: "password")
        
        if(userEmailstore == userEmail)
        {
            if(passwordStore == password)
            {
                // Login as the username and password is correct
                defaults.set(true, forKey: "IsUserLoggedIn")
                UserDefaults.standard.synchronize()
                
                self.dismiss(animated: true, completion: nil);
            }
        }else{
            print("password does not match")
            
            displayMyAlertMessage(userMessage: "UserName and Password dont match");
         
            
            
        }
        
       
    }
    
    func displayMyAlertMessage(userMessage: String)
    {
        let myalert = UIAlertController(title: "alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        
        myalert.addAction(okAction);
        
        self.present(myalert, animated:true, completion: nil);
    }
    
  

}
