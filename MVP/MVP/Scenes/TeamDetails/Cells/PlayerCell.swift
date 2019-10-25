//
//  PlayerCell.swift
//  MVP
//
//  Created by Fromage Charley on 25/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var transferValueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    func setup(with player: Player) {
        nameLabel.text = player.name
        positionLabel.text = player.position
        birthDateLabel.text = player.birthDate
        transferValueLabel.text = player.transferValue

        if let photoURLString = player.photoURL, let imageURL = URL(string: photoURLString) {
            photoImageView.af_setImage(withURL: imageURL)
        }
    }
}
