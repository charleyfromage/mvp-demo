//
//  TeamsListPresenter.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation

class TeamsListPresenter: BasePresenter<TeamsListView> {
    var teams = [Team]()
    private let service = SportDBService()

    func fetchTeams(for country: String?, completion: @escaping () -> Void) {
        guard let country = country, country != "" else {
            teams.removeAll()
            completion()

            return
        }

        service.getTeamsList(for: country) { [weak self] teams, error in
            guard let teams = teams else { return }
            
            self?.teams = teams.list

            completion()
        }
    }

    func cellSelected(for row: Int) {
        let selectedTeam = teams[row]

        let parameters = [TeamDetailsPresenter.teamKey: selectedTeam]
        let context = RouteContext(with: parameters)
        view?.openChildScreen(.teamDetailsView, fromStoryboard: .main, withContext: context)
    }
}
