//
//  TeamsListPresenter.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation

class TeamsListPresenter: BasePresenter
//<NewspapersMvpView>
{
    var teams = [Team]()
    private let service = SportDBService()

//    func selectedCell(withRow: Int) {
//        let parameters = [NewspaperDetailVC.ArgNewspaperDetailUrl: newspapersList[withRow].url, NewspaperDetailVC.ArgNewspaperDetailTitle: newspapersList[withRow].title]
//        let context = RouteContext(parameters)
//        mvpView?.openChildScreen(.newspaperDetail, fromStoryboard: .main, withContext: context)
//    }

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
}
