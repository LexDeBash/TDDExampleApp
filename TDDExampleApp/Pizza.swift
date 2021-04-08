//
//  Pizza.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 16/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

struct Pizza {
    
    let name: String
}

// Pizza+Fixture.swift
extension Pizza {
    
    static func fixture(name: String = "Margherita") -> Pizza {
        return Pizza(name: name)
    }
}
