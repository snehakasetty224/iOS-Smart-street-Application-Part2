//
//  AddCommentViewController.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 9/19/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit

class AddCommentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var comment: UITextField!
    
    
    @IBOutlet var starButtons: [UIButton]!
    var tag = 0
    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        tag = sender.tag
        for button in starButtons{
            if button.tag <= tag {
                //select
                button.setTitle("★", for: .normal)
            }else{
                button.setTitle("☆", for: .normal)
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addComment(_ sender: Any) {
        
       /* taskMgr.addTask(name: name.text!, desc: comment.text!)
        self.view.endEditing(true)
        name.text = ""
        comment.text = ""
        self.tabBarController?.selectedIndex = 0;*/
        
        list.append(name.text!)
        descr.append(comment.text!)
        star.append(tag)
        name.text = ""
        comment.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }

}
