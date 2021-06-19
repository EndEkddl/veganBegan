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
        for i in 0...44 {
            let item1 = TableViewItem()
            item1.text = name
            items.append(item1)
        }
    }
    
    // MARK:- Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 45;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewItem", for: indexPath)
        let item = items[indexPath.row]

        configureText(for: cell, with: item)
        return cell
    }
    
    func configureText(for cell: UITableViewCell, with item: TableViewItem) {
              let label = cell.viewWithTag(1000) as! UILabel
              label.text = item.text
    }
}
