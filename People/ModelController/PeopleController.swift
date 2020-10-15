//
//  PeopleController.swift
//  People
//
//  Created by Hector Villasano on 10/6/20.
//

import Foundation

class PeopleController {
    private (set) var peopleList = [Person]()
    
    init() {
        let hector = Person(name: "Hector")
        let shawn = Person(name: "Shawn")
        let micheal = Person(name: "Micheal")
        
        [hector, shawn, micheal].forEach {
            peopleList.append($0)
        }
    }
    
    
}
