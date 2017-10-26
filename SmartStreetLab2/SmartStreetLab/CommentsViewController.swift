//
//  CommentsViewController.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 9/19/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit
// list of comments, their description and rate
    var list = ["Sneha", "Vinay"]
    var descr = ["This app is good", "this app is not good"]
    var star = [4,3]


class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var myTableView: UITableView!
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //return taskMgr.tasks.count
        
        return (list.count)
    }
    

        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
      //  cell.name1?.text = taskMgr.tasks[indexPath.row].name
       // cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        
        cell.name1.text = list[indexPath.row]
        cell.desc1.text = descr[indexPath.row]
        
        // for stares
        for button in cell.rateButton{
            if button.tag <= star[indexPath.row] {
                //select
                button.setTitle("★", for: .normal)
            }else{
                button.setTitle("☆", for: .normal)
            }
        }

        
        return (cell)
    }

    // for deleting row
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
