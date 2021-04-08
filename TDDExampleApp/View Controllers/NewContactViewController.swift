//
//  NewContactViewController.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 21/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    var contactManager: ContactManager!
    
    @IBAction func saveButtonPressed() {
        let name = nameTextField.text
        let surname = surnameTextField.text
        let phone = phoneTextField.text
        
        let imageData = #imageLiteral(resourceName: "avatar").pngData()
        let newContact = Person(
            name: name ?? "Noname",
            surname: surname ?? "",
            phone: phone ?? "000",
            image: imageData
        )
        
        contactManager.contactList.append(newContact)
        dismiss(animated: true)
    }
    @IBAction func cancelButtonPressed() {
    }
}
