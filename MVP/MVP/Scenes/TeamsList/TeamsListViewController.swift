//
//  TeamsListViewController.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class TeamsListViewController: BaseViewController<TeamsListPresenter> {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: TeamCell.identifier, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: TeamCell.identifier)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func initPresenter(with context: RouteContext?) {
        presenter = TeamsListPresenter()
        presenter?.attachView(view: self)
        presenter?.setContext(to: context)
    }
}

extension TeamsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.teams.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCell.identifier, for: indexPath) as? TeamCell,
              let team = presenter?.teams[indexPath.row]
        else {
            return UICollectionViewCell()
        }

        cell.setup(with: team)

        return cell
    }
}

extension TeamsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.cellSelected(for: indexPath.row)
    }
}

extension TeamsListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.fetchTeams(for: searchBar.text)

        searchBar.resignFirstResponder()
    }
}

extension TeamsListViewController: TeamsListView {
    func updateList() {
        collectionView.reloadData()
    }
}
