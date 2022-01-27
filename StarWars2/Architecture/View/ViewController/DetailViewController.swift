//
//  DetailViewController.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!

    lazy var viewModel: DetailViewModelProtocol = {
        let viewModel = DetailViewModel()
        return viewModel
    }()
    private var dataSource: TableCellDataSource<DetailRowViewCell, (DetailDisplayFields, Any?)>!
    private weak var delegate: TableCellDelegate<UITableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDataSource()
        title = viewModel.item?.name
    }

}

extension DetailViewController {

    private func updateDataSource() {
        dataSource = TableCellDataSource(cellIdentifier: StoryboardIds.detailRowViewCell,
                                         items: viewModel.fields,
                                         configureCell: { (cell, data, _) in
            cell.field = data
        })

        delegate = TableCellDelegate(cellIdentifier: StoryboardIds.detailRowViewCell) as? TableCellDelegate

        DispatchQueue.main.async {
            self.detailTableView.dataSource = self.dataSource
            self.detailTableView.delegate = self.delegate
            self.detailTableView.reloadData()
        }

    }

}
