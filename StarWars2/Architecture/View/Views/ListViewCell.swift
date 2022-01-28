//
//  ListViewCell.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class ListViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - Variables

    var data: Planets? {

        didSet {
            configureCell()
        }

    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

// MARK: - Custom methods

extension ListViewCell {

    private func configureCell() {
        nameLabel.text = data?.name
        var description = ""
        if let peopleCount = data?.people?.peopleList?.count {
            description += "\(peopleCount) residents,\n"
        }
        if let filmCount = data?.films?.filmList?.count {
            description += "Appeared in \(filmCount) films\n"
        }
        if let surfaceWater = data?.surfaceWater {
            description += "Having \(surfaceWater) % water sources"
        }
        descriptionLabel.text = description
    }

}
