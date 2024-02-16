//
//  TaskViewController.swift
//  TaskApp
//
//  Created by Jennifer Nelson on 16/02/2024.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "delete", style: .done, target: self, action:#selector(deleteTask))
    }
    
    @objc func deleteTask(){
//
//        let newCount = count - 1
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task\(currentPosition)")
    }
    
   
}

