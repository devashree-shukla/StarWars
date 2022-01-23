//
//  HomeViewCell.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class HomeViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        titleLabel.text = " Hello"
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
    
        super.setSelected(selected, animated: animated)
    
    }

}
