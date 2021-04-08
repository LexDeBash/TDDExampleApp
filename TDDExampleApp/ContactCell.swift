//
//  ContactCell.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 17/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    
    func configureCell(with person: Person) {
        nameLabel.text = person.name
    }
}
