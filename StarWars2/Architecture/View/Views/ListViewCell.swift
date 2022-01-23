//
//  ListViewCell.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Variables
    
    var data: String? {
        
        didSet {
            configureCell()
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//MARK: - Custom methods

extension ListViewCell {
    
    private func configureCell() {
        nameLabel.text = data
    }
    
}

