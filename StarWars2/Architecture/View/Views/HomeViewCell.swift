//
//  HomeViewCell.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class HomeViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var itemLabel: UILabel!
    
    // MARK: - Variables
    
    var data: StarWars? {
        
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

//MARK: - Custom methods

extension HomeViewCell {
    
    private func configureCell() {
        itemLabel.text = data?.description
    }
    
}
