//
//  ContactListViewController.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 17/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataSource: ContactListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        let contactManager = ContactManager()
        dataSource.contactManager = contactManager
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showDetail(withNotification:)),
            name: NSNotification.Name(rawValue: "DidSelectRow notification"),
            object: nil)
        
        view.accessibilityIdentifier = "mainView"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addNewContact(_ sender: UIBarButtonItem) {
        if let newContactVC = storyboard?.instantiateViewController(
            withIdentifier: "NewContactViewController"
            ) as? NewContactViewController {
            
            newContactVC.contactManager = dataSource.contactManager
            present(newContactVC, animated: true)
        }
    }
    
    @objc func showDetail(withNotification notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let person = userInfo["person"] as? Person,
            let detailVC = storyboard?.instantiateViewController(
                withIdentifier: "DetailViewController"
            ) as? DetailViewController
            else { fatalError() }
        
        detailVC.person = person
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
