//
//  Person.swift
//  People
//
//  Created by Hector Villasano on 12/8/20.
//

import Foundation


struct Result: Decodable {
    let results: [Person]
}

struct Person: Decodable {
    let fullName: String
    let gender: String
    let email: String
    
    // location
    let street: String
    let city: String
    let state: String
    let counrty: String
    let postalCode: String
    
    let latitude: Double
    let longitude: Double
    
    let timeZoneOffSet: String
    let timeZoneDescription: String
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case email
        case location
        
        enum nameCodingKey: String, CodingKey {
            case title
            case first
            case last
        }
        
        enum locationCodingKey: String, CodingKey {
            case street
            case city
            case state
            case country
            case postcode
            case coordinates
            case timezone
            
            enum streetCodingKey: String, CodingKey {
                case number
                case name
            }
            
            enum coordinatesCodingKeys: String, CodingKey {
                case latitude
                case longitude
            }
           
            enum timeZoneCodingKeys: String, CodingKey{
                case offset
                case description
            }
            
        }
        
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let nameContainer = try container.nestedContainer(keyedBy: CodingKeys.nameCodingKey.self, forKey: .name)
        let title = try nameContainer.decode(String.self, forKey: .title)
        let first = try nameContainer.decode(String.self, forKey: .first)
        let last = try nameContainer.decode(String.self, forKey: .last)
        
        fullName = "\(title). \(first) \(last)"
        
        email = try container.decode(String.self, forKey: CodingKeys.email)
        gender = try container.decode(String.self, forKey: CodingKeys.gender)
        
        let locationContainer = try container.nestedContainer(keyedBy: CodingKeys.locationCodingKey.self, forKey: .location)
        let locationStreetContainer = try locationContainer.nestedContainer(keyedBy: CodingKeys.locationCodingKey.streetCodingKey.self, forKey: .street)
        
        let streetNumber = try locationStreetContainer.decode(Int.self, forKey: .number)
        let streetName = try locationStreetContainer.decode(String.self, forKey: .name)

        street = "\(streetNumber) \(streetName)"
        
        city = try locationContainer.decode(String.self, forKey: .city)
        state = try locationContainer.decode(String.self, forKey: .state)
        counrty = try locationContainer.decode(String.self, forKey: .country)
        
        let postCode = try locationContainer.decode(Int.self, forKey: .postcode)
        postalCode = String(postCode)
        
        let locationCoordinatesContainer = try locationContainer.nestedContainer(keyedBy: CodingKeys.locationCodingKey.coordinatesCodingKeys.self, forKey: .coordinates)
        
        let latitudeString = try locationCoordinatesContainer.decode(String.self, forKey: .latitude)
        latitude = Double(latitudeString)!
        
        let longitudeString = try locationCoordinatesContainer.decode(String.self, forKey: .longitude)
        longitude = Double(longitudeString)!
        
        let locationTimeZoneContainer = try locationContainer.nestedContainer(keyedBy: CodingKeys.locationCodingKey.timeZoneCodingKeys.self, forKey: .timezone)
        timeZoneOffSet = try locationTimeZoneContainer.decode(String.self, forKey: .offset)
        timeZoneDescription = try locationTimeZoneContainer.decode(String.self, forKey: .description)
        
        
        
    }
}
