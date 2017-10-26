//
//  ViewController.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 9/16/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "IsUserLoggedIn");
        
        if(!isUserLoggedIn)
        {
        self.performSegue(withIdentifier: "loginView", sender: self)
        }
        
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
        
        UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.performSegue(withIdentifier: "loginView", sender: self)
        
    }
    


}

