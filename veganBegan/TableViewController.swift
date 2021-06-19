//
//  TableViewController.swift
//  veganBegan
//
//  Created by Release on 2021/06/13.
//  Copyright © 2021 Release. All rights reserved.
//

import SwiftUI
import UIKit

class TableViewController: UITableViewController{
    var items = [TableViewItem]()
    var name = "restaurant name"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
     
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewItem")
        DatabaseManager.sortbyDistance(latitude:37.551727, longitude: 126.941062, completion: {data in
            for i in 0...44 {
                let item1 = TableViewItem()
                item1.text = data[i]["name"] as! String
             //   print(item1.text)
                self.items.append(item1)
            }
            self.tableView.reloadData()
        })
        /*for i in 0...44 {
            let item1 = TableViewItem()
            item1.text = name
            self.items.append(item1)
        }*/
    }
    
    // MARK:- Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell{

            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewItem", for: indexPath)
            let item = items[indexPath.row]
            cell.tag = 1000
            configureText(for: cell, with: item)
        
            return cell
        }

        
   
    
    
    func configureText(for cell: UITableViewCell, with item: TableViewItem) {
       // let label = cell.viewW
        let label = (cell.viewWithTag(1000) as! UITableViewCell).textLabel as! UILabel
              label.text = item.text
            //    label.tag = 1000
    }
}
