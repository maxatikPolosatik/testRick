//
//  Characters.swift
//  RickAndMortyTest
//
//  Created by Dinmukhamed on 10.01.2025.
//

import Foundation
import SwiftyJSON

struct CharactersResponse: Codable {
    let info: Info
    let characters: [PersonCharacter]
    
    init(json: JSON) {
        self.info = Info(json: json["info"])
        self.characters = json["results"].arrayValue.map { PersonCharacter(json: $0) }
    }
}

struct Info: Codable {
    let count, pages: Int
    
    init(json: JSON) {
        self.count = json["count"].intValue
        self.pages = json["pages"].intValue
    }
}

struct PersonCharacter: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let url: String
    let location: PersonLocation
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.status = json["status"].stringValue
        self.species = json["species"].stringValue
        self.type = json["type"].stringValue
        self.gender = json["gender"].stringValue
        self.image = json["image"].stringValue
        self.url = json["url"].stringValue
        self.location = PersonLocation(json: json["location"])
    }
}

struct PersonLocation: Codable {
    let name: String
    let url: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.url = json["url"].stringValue
    }
}
