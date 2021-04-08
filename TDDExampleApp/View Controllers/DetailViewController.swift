//
//  DetailViewController.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 19/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var person: Person!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let image = UIImage(data: person.image!) else { return }
        
        nameLabel.text = person.name
        surnameLabel.text = person.surname
        phoneLabel.text = person.phone
        imageView.image = image
    }
}
