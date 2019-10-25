//
//  Player.swift
//  MVP
//
//  Created by Fromage Charley on 25/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation

struct Players {
    let list: [Player]
}

extension Players: Decodable {
    private enum CodingKeys: String, CodingKey {
        case players = "player"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.list = try container.decode([Player].self, forKey: .players)
    }
}

struct Player {
    let name: String
    let position: String?
    let birthDate: String?
    let transferValue: String?
    let photoURL: String?
}

extension Player: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name = "strPlayer"
        case position = "strPosition"
        case birthDate = "dateBorn"
        case transferValue = "strWage"
        case photoURL = "strThumb"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.position = try container.decode(String?.self, forKey: .position)
        self.birthDate = try container.decode(String?.self, forKey: .birthDate)
        self.transferValue = try container.decode(String?.self, forKey: .transferValue)
        self.photoURL = try container.decode(String?.self, forKey: .photoURL)
    }
}
