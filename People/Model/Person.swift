//
//  Person.swift
//  People
//
//  Created by Hector Villasano on 12/8/20.
//

import Foundation

struct Result: Codable {
    let results: [Person]
}

struct Person: Codable {
    let email: String
    let gender: String
    
}
