//
//  Person.swift
//  People
//
//  Created by Hector Villasano on 10/6/20.
//

import Foundation

class Person {
    
    var isFavorite = false
    let fullName: String
    let thumbnailUrl: URL
    let pictureLargeUrl: URL
    let age: Int
    
    init(fullName: String, thumbnailUrl: URL, pictureLargeUrl: URL, age: Int) {
        self.fullName = fullName
        self.thumbnailUrl = thumbnailUrl
        self.pictureLargeUrl = pictureLargeUrl
        self.age = age
    }
    
    convenience init(person_rep: Person_Rep) {
        self.init(fullName: person_rep.fullName, thumbnailUrl: person_rep.thumbnailUrl, pictureLargeUrl: person_rep.pictureLargeUrl, age: person_rep.age)
    }
    
}
