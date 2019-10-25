//
//  Constants.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

enum Constants {
    enum APIs {
        static let sportDBAPIBaseURL = "https://www.thesportsdb.com/api/v1/json/%@/"
        static let sportDBAPISearchTeamsEndPoint = "search_all_teams.php?s=Soccer&c=%@"
        static let sportDBAPISearchPlayersEndPoint = "lookup_all_players.php?id=%@"
    }

    enum Storyboards: String {
        case main = "Main"
        case teamsList = "TeamsListView"
        case teamDetails = "TeamDetailsView"
    }

    enum Scenes: String {
        case teamsListView = "TeamsListView"
        case teamDetailsView = "TeamDetailsView"
    }

    enum Segues {
        static let showTeamDetails = "showTeamDetails"
    }
}
