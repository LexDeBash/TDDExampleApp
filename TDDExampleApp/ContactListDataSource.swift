//
//  ContactListDataSource.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 17/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class ContactListDataSource: NSObject {
    var contactManager: ContactManager?
}

// MARK: - UITableViewDataSource
extension ContactListDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactManager?.contactList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactCell
        
        if let person = contactManager?.contactList[indexPath.row] {
            cell.configureCell(with: person)
        }
        
        return cell
    }
}

extension ContactListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let person = contactManager?.contactList[indexPath.row]
            else { return }
        NotificationCenter.default.post(
            name: NSNotification.Name("DidSelectRow notification"),
            object: self,
            userInfo: ["person": person]
        )
    }
}
