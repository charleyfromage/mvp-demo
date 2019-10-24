//
//  TeamCell.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TeamCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(with team: Team) {
        label.text = team.name

        if let imageURL = URL(string: team.logoURL) {
            imageView.af_setImage(withURL: imageURL)
        }
    }
}
