//
//  TaskManager.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 9/19/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task{
    var name = "Un-Named"
    var desc = "Un-Described"

}

class TaskManager: NSObject {
    
    var tasks = [task]()
    
    
    func addTask(name: String, desc: String){
        
        tasks.append(task(name: name, desc:desc))
        
    }

}
