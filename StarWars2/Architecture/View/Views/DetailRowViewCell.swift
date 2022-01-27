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

    var field: (DetailDisplayFields, Any?)? {
        didSet {
            setupViewForCellType()
            setTitle()
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

    private func setupViewForCellType() {
        switch field?.0 {
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

    private func setTitle() {
        titleLabel.text = field?.0.rawValue.capitalized
    }

    func configureCell() {
        stackView.removeAllSubviews()
        descriptionLabel.text = ""
        if let value = (field?.1 as? String) {
            switch field?.0 {
            case .terrain, .climate:
                value.split(separator: ",").forEach {
                    self.createLabel(String($0))
                }
            case .surfaceWater:
                descriptionLabel.text = value.percetageString
            case .rotationPeriod:
                descriptionLabel.text = value.hoursString
            case .orbitalPeriod:
                descriptionLabel.text = value.daysString
            case .gravity:
                descriptionLabel.text = value.gravityString
            case .diameter:
                descriptionLabel.text = value.diameterString
            case .films, .residents:
                print(value)
            default: descriptionLabel.text = value
            }
        } else if let value = (field?.1 as? Date) {
            descriptionLabel.text = value.description
        } else {
            descriptionLabel.text = "---"
        }
    }

    private func createLabel(_ text: String?) {
        guard let text = text else {
            return
        }
        let lbl = UILabel()
        lbl.text = "  \(text.capitalized)  "
        lbl.backgroundColor = .systemBlue
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.clipsToBounds = true
        lbl.numberOfLines = 1
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        lbl.cornerRadius = lbl.frame.height / 2
    }
}
