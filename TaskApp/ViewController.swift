//
//  ViewController.swift
//  TaskApp
//
//  Created by Jennifer Nelson on 16/02/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView:UITableView!
    
    var tasks = [String]()//array of strings to hold data from cells
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true,forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        //Get all current saved tasks
        updateTasks()
    }

    func updateTasks() {
        
    }
    
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}
