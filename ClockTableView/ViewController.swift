//
//  ViewController.swift
//  ClockTableView
//
//  Created by Tim Davies on 28/09/2018.
//  Copyright © 2018 Tim Davies. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.barTintColor = UIColor(white: 0.09, alpha: 1)
        
        tableView.separatorColor = UIColor(white: 0.16, alpha: 1)
        tableView.backgroundColor = UIColor(white: 0.05, alpha: 1)
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.tableFooterView?.isHidden = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "clock") as? ClockTableViewCell
        if cell == nil {
            cell = ClockTableViewCell(style: .subtitle, reuseIdentifier: "clock")
        }
        
        cell?.textLabel?.text = "07:00"
        cell?.detailTextLabel?.text = "Morning alarm"
        
        return cell!
    }

}

