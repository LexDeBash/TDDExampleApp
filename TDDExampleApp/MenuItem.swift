//
//  MenuItem.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 16/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

struct MenuItem {
    
    let title: String
}

extension MenuItem {
    
    init(pizza: Pizza) {
        self.init(title: pizza.name)
    }
}
