//
//  TableCellDelegate.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import Foundation
import UIKit

class TableCellDelegate<CELL: UITableViewCell>: NSObject, UITableViewDelegate {

    // MARK: - Variables

    private var cellIdentifier: String!
    var didSelect: ((Int) -> Void)?

    // MARK: - Overrides

    init(cellIdentifier: String) {

        self.cellIdentifier = cellIdentifier

    }

    // MARK: - Tableview

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        didSelect?(indexPath.row)

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        UITableView.automaticDimension

    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        0.0001

    }

}
