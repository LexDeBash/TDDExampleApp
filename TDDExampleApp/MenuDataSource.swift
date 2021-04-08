//
//  MenuDataSource.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 16/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

struct MenuDataSource {
    
    let pizzas: [Pizza]
    let numberOfSections = 1
    
    func numberOfRows(inSection section: Int) -> Int {
        guard section == 0 else { return 0 }
        return pizzas.count
    }
    
    func item(forRow row: Int, inSection section: Int) -> MenuItem? {
        guard section == 0 else { return .none }
        guard row >= 0, pizzas.count > row else { return .none }
        
        return MenuItem(pizza: pizzas[row])
    }

}
