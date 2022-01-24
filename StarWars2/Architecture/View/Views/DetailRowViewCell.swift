//
//  DetailRowViewCell.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class DetailRowViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Variables
    
    var data: [String: Any]? {
        didSet {
            setupView()
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


extension DetailRowViewCell {
    
    func setupView() {
        switch DetailDisplayFields.displayFieldType(data?.keys.first! ?? "").0 {
        case .terrain, .climate:
            descriptionLabel.isHidden = true
            stackView.isHidden = false
        case .films, .residents:
            descriptionLabel.isHidden = false
            stackView.isHidden = true
        default:
            descriptionLabel.isHidden = false
            stackView.isHidden = true
        }
    }
    
    
    func configureCell() {
        titleLabel.text = DetailDisplayFields.displayFieldType(data?.keys.first ?? "").1
        
        switch DetailDisplayFields.displayFieldType(data?.keys.first ?? "").0 {
        case .created, .edited :
            descriptionLabel.text = (data?.values.first as? String)?.toDate()?.description
        case .terrain, .climate:
            data?.values.forEach {
                stackView.removeAllSubviews()
                let lbl = UILabel()
                if let k = $0 as? String {
                    lbl.text = "  \(k)  "
                }
                lbl.backgroundColor = .systemBlue
                lbl.translatesAutoresizingMaskIntoConstraints = false
                lbl.clipsToBounds = true
                lbl.sizeToFit()
                lbl.numberOfLines = 0
                stackView.addArrangedSubview(lbl)
                lbl.cornerRadius = lbl.frame.height / 2
            }
        case .surfaceWater:
            if let k = data?.values.first as? String {
                descriptionLabel.text = k.percetageString
            }
        case .rotationPeriod:
            if let k = data?.values.first as? String {
                descriptionLabel.text = k.hoursString
            }
        case .orbitalPeriod:
            if let k = data?.values.first as? String {
                descriptionLabel.text = k.daysString
            }
        case .gravity:
            if let k = data?.values.first as? String {
                descriptionLabel.text = k.gravityString
            }
        case .diameter:
            if let k = data?.values.first as? String {
                descriptionLabel.text = k.diameterString
            }
        case .films, .residents:
            descriptionLabel.text = data?.values.description
        default: descriptionLabel.text = data?.values.first as? String
        }
    }
}
