//
//  Person.swift
//  People
//
//  Created by Hector Villasano on 12/8/20.
//

import Foundation

struct Result: Decodable {
    let results: [Person_Rep]
}

struct Person_Rep: Decodable {
    let fullName: String
    let gender: String
    let age: Int
    let dob: String
    
    let email: String
    let phone: String
    let cell: String
    
    // pictures
    let pictureLargeUrl: URL
    let pictureMediumUrl: URL
    let thumbnailUrl: URL
    
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
        case dob
        case gender
        case email
        case cell
        case phone
        case picture
        case location
        
        enum nameCodingKey: String, CodingKey {
            case title
            case first
            case last
        }
        
        enum dobCodingKey: String, CodingKey {
            case date
            case age
        }
        
        enum pictureCodingKey: String, CodingKey {
            case large
            case medium
            case thumbnail
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
        
        // gender
        gender = try container.decode(String.self, forKey: CodingKeys.gender)
        
        // name
        let nameContainer = try container.nestedContainer(keyedBy: CodingKeys.nameCodingKey.self, forKey: .name)
        let title = try nameContainer.decode(String.self, forKey: .title)
        let first = try nameContainer.decode(String.self, forKey: .first)
        let last = try nameContainer.decode(String.self, forKey: .last)
        fullName = "\(title). \(first) \(last)"
        
        // dob
        let dobContainer = try container.nestedContainer(keyedBy: CodingKeys.dobCodingKey.self, forKey: .dob)
        age = try dobContainer.decode(Int.self, forKey: .age)
        dob = try dobContainer.decode(String.self, forKey: .date)
        
        email = try container.decode(String.self, forKey: CodingKeys.email)
        phone = try container.decode(String.self, forKey: .phone)
        cell = try container.decode(String.self, forKey: .cell)
        
        // Picture
        
        let pictureContainer = try container.nestedContainer(keyedBy: CodingKeys.pictureCodingKey.self, forKey: .picture)
        
        let pictureLarge = try pictureContainer.decode(String.self, forKey: .large)
        pictureLargeUrl = URL(string: pictureLarge)!
        
        let pictureMedium = try pictureContainer.decode(String.self, forKey: .medium)
        pictureMediumUrl = URL(string: pictureMedium)!
        
        let thumbnailString = try pictureContainer.decode(String.self, forKey: .thumbnail)
        thumbnailUrl = URL(string: thumbnailString)!
        
        
        // location
        let locationContainer = try container.nestedContainer(keyedBy: CodingKeys.locationCodingKey.self, forKey: .location)
        let locationStreetContainer = try locationContainer.nestedContainer(keyedBy: CodingKeys.locationCodingKey.streetCodingKey.self, forKey: .street)
        
        let streetNumber = try locationStreetContainer.decode(Int.self, forKey: .number)
        let streetName = try locationStreetContainer.decode(String.self, forKey: .name)

        street = "\(streetNumber) \(streetName)"
        
        city = try locationContainer.decode(String.self, forKey: .city)
        state = try locationContainer.decode(String.self, forKey: .state)
        counrty = try locationContainer.decode(String.self, forKey: .country)
        
//        let postCode = try locationContainer.decode(Int.self, forKey: .postcode)
        postalCode = ""//String(postCode)
        
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
