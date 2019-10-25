//
//  TeamDetailsViewController.swift
//  MVP
//
//  Created by Fromage Charley on 25/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class TeamDetailsViewController: BaseViewController<TeamDetailsPresenter> {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: PlayerCell.identifier, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: PlayerCell.identifier)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func initPresenter(with context: RouteContext?) {
        presenter = TeamDetailsPresenter()
        presenter?.attachView(view: self)
        presenter?.setContext(to: context)

        presenter?.fetchPlayers()
    }
}

extension TeamDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.players.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerCell.identifier, for: indexPath) as? PlayerCell,
              let player = presenter?.players[indexPath.row]
        else {
            return UITableViewCell()
        }

        cell.setup(with: player)

        return cell
    }
}

extension TeamDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension TeamDetailsViewController: TeamDetailsView {
    func updateList() {
        tableView.reloadData()
    }
}
