//
//  PeopleController.swift
//  People
//
//  Created by Hector Villasano on 10/6/20.
//

import Foundation

class PeopleController {
//    private (set) var people = [PersonRep]()
    private (set) var people = [Person]()
    
    init() {
//        let hector = PersonRep(name: "Hector")
//        let shawn = PersonRep(name: "Shawn")
//        let michael = PersonRep(name: "Michael")
//        
//        [hector, shawn, michael].forEach {
//            people.append($0)
//        }
//        
//        fetchPeople { error in
//            if let error = error {
//                print(error)
//            }
//        }
    }
    
    func fetchPeople(completion: @escaping (Error?) -> ()) {
        let url = URL(string: "https://randomuser.me/api/?results=5")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(error)
            }
            
            guard let data = data else {
                completion(NSError(domain: "", code: -1, userInfo: nil))
                return
            }
            
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString!)
            
            do {
                let result = try JSONDecoder().decode(Result.self, from: data)
                self.people = result.results
                completion(nil)
            }catch {
                completion(error)
            }
            
            completion(nil)
        }.resume()
    }
    
}
