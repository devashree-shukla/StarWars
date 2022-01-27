//
//  HomeViewController.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!

    lazy var viewModel: HomeViewModelProtocol = {
        let viewModel = HomeViewModel()
        return viewModel
    }()

    private var dataSource: TableCellDataSource<UITableViewCell, StarWars>!
    private var delegate: TableCellDelegate<UITableViewCell>?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDataSource()
    }

}

// MARK: - Custom methods

extension HomeViewController {

    private func updateDataSource() {

        dataSource = TableCellDataSource(cellIdentifier: StoryboardIds.homeViewCell,
                                         items: viewModel.starWarsItems,
                                         configureCell: { (cell, data, index) in
            (cell as? HomeViewCell)?.data = data
            if index != 0 {
                (cell as? HomeViewCell)?.itemLabel.alpha = 0.5
                (cell as? HomeViewCell)?.isUserInteractionEnabled = false
            } else {
                (cell as? HomeViewCell)?.itemLabel.alpha = 1
                (cell as? HomeViewCell)?.isUserInteractionEnabled = true
            }
        })

        delegate = TableCellDelegate(cellIdentifier: StoryboardIds.homeViewCell)

        delegate?.didSelect = { _ in
            self.performSegue(withIdentifier: StoryboardIds.showListSegue, sender: self)
        }

        DispatchQueue.main.async {
            self.homeTableView.dataSource = self.dataSource
            self.homeTableView.delegate = self.delegate
            self.homeTableView.reloadData()
        }

    }

}

// MARK: - Navigation

extension HomeViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardIds.showListSegue {
            if let listVC = segue.destination as? ListViewController {
                listVC.viewModel.starWarsItem = viewModel.selectedItem(
                    index: homeTableView.indexPathForSelectedRow?.row ?? 0)
            }
        }
    }
}
