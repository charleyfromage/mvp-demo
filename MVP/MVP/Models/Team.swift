//
//  Team.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation

struct Teams {
    let list: [Team]
}

extension Teams: Decodable {
    private enum CodingKeys: String, CodingKey {
        case teams = "teams"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.list = try container.decode([Team].self, forKey: .teams)
    }
}

struct Team {
    let id: String
    let name: String
    let logoURL: String
}

extension Team: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "idTeam"
        case name = "strTeam"
        case logoURL = "strTeamBadge"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.logoURL = try container.decode(String.self, forKey: .logoURL)
    }
}
