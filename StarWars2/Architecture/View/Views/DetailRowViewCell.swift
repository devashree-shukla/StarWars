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
            titleLabel.text = field?.0.rawValue.capitalized
            setupViewForCellType()
            configureCell()
        }
    }
    var onButtonSelected: ((Any?) -> Void)?

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
            stackView.isHidden = false
        default:
            descriptionLabel.isHidden = false
            stackView.isHidden = true
        }
    }

    func configureCell() {
        stackView.removeAllSubviews()
        descriptionLabel.text = ""
        if let value = (field?.1 as? String) {
            setStringTypes(value)
        } else if let value = (field?.1 as? Date) {
            descriptionLabel.text = value.description
        } else if let value = (field?.1 as? FilmsNSSecureCoding) {
            setFilmsType(value)
        } else if let value = (field?.1 as? PeopleNSSecureCoding) {
            setPeopleType(value)
        } else {
            descriptionLabel.text = "---"
        }
    }

    @objc private func itemSelected() {
        onButtonSelected?(field?.1)
    }
}

private extension DetailRowViewCell {

    private func setStringTypes(_ value: String) {
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
        default: descriptionLabel.text = value
        }
    }

    private func setFilmsType(_ value: FilmsNSSecureCoding) {
        if let peoplCount = value.filmList?.count {
            descriptionLabel.text = "In \(peoplCount) films this planet was appeared."
            descriptionLabel.font = .systemFont(ofSize: 14)
            value.filmList?.forEach {
                self.createButton(String($0.title ?? "---"))
            }
        } else {
            descriptionLabel.text = "---"
        }
    }

    private func setPeopleType(_ value: PeopleNSSecureCoding) {
        if let peoplCount = value.peopleList?.count {
            descriptionLabel.text = "\(peoplCount) people leave on this planet."
            descriptionLabel.font = .systemFont(ofSize: 14)
            value.peopleList?.forEach {
                self.createButton(String($0.name ?? "---"))
            }
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

    private func createButton(_ text: String?) {
        guard let text = text else {
            return
        }
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.setTitle("  \(text.capitalized)  ", for: .normal)
        button.borderColor = .orange
        button.borderWidth = 1
        button.clipsToBounds = true
        button.setTitleColor(.orange, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.titleLabel?.numberOfLines = 1
        button.sizeToFit()
        button.addTarget(self, action: #selector(itemSelected), for: .touchUpInside)
        stackView.addArrangedSubview(button)
        button.cornerRadius = 4
    }

}
