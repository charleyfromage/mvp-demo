//
//  TeamDetailsPresenter.swift
//  MVP
//
//  Created by Fromage Charley on 25/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation

class TeamDetailsPresenter: BasePresenter<TeamDetailsView> {
    static let teamKey = "team"

    var team: Team?
    var players = [Player]()
    private let service = SportDBService()

    override func setContext(to context: RouteContext?) {
        guard let context = context else { return }

        team = context[TeamDetailsPresenter.teamKey]
    }

    func fetchPlayers() {
        guard let team = team else { return }

        service.getPlayersList(for: team.id) { [weak self] players, error in
            guard let players = players else { return }

            self?.players = players.list
            self?.view?.updateList()
        }
    }
}
