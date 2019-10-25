//
//  TeamDetailsViewController.swift
//  MVP
//
//  Created by Fromage Charley on 25/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class TeamDetailsViewController: BaseViewController<TeamDetailsPresenter>, TeamDetailsView {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initPresenter(with context: RouteContext?) {
        presenter = TeamDetailsPresenter()
        presenter?.attachView(view: self)
        presenter?.setContext(to: context)
    }
}
