//
//  TeamsListViewController.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class TeamsListViewController: BaseViewController<TeamsListPresenter>, TeamsListView {
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

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier {
//            case Constants.Segues.showTeamDetails:
//                if let teamDetailsViewController = segue.destination as? TeamDetailsViewController {
//                    teamDetailsViewController.presenter?.team = presenter?.selectedTeam
//                }
//
//            default: break
//        }
//
////        if segue.destination is TertiaryViewController {
////               let vc = segue.destination as? TertiaryViewController
////               vc?.username = "Arthur Dent"
////           }
//    }
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
        presenter?.fetchTeams(for: searchBar.text) { [weak self] in
            self?.collectionView.reloadData()
        }

        searchBar.resignFirstResponder()
    }
}
