//
//  PersonRep.swift
//  People
//
//  Created by Hector Villasano on 10/6/20.
//

import Foundation

class PersonRep: Codable {
    let name: String
    var isFavorite = false
    
    init(name: String) {
        self.name = name
    }
}
