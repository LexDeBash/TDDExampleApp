//
//  ViewController.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 16/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let menuDataSource = MenuDataSource(pizzas: [Pizza(name: "dsfd")])

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return menuDataSource.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuDataSource.numberOfRows(inSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let item = menuDataSource.item(forRow: indexPath.row, inSection: indexPath.section) else {
            return cell
        }
        
        cell.textLabel?.text = item.title
        
        return cell
    }
}

