//
//  LabViewController.swift
//  TableMS
//
//  Created by Евгений Ротарь on 11.06.2018.
//  Copyright © 2018 Евгений Ротарь. All rights reserved.
//

import UIKit

class LabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let ind = "secondCell"
    var mathPair: Pair = Pair()
    @IBOutlet weak var labTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTable()
        
    }
    func createTable(){
        
        labTable.register(UITableViewCell.self, forCellReuseIdentifier: ind)
        labTable.delegate = self
        labTable.dataSource = self
        labTable.estimatedRowHeight = 1000
        labTable.rowHeight = UITableViewAutomaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return mathPair.getNumOfLab()
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ind, for: indexPath)
        cell.textLabel?.text = "\(mathPair.getNameOfLab()[indexPath.row])"
        labTable.setNeedsLayout()
        labTable.layoutIfNeeded()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57.5
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

