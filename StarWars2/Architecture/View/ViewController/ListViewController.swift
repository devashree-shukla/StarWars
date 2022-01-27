//
//  ListViewController.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit
import CoreData

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!

    lazy var viewModel: ListViewModelProtocol = {
        let viewModel = ListViewModel()
        return viewModel
    }()
    private var dataSource: TableCellDataSource<UITableViewCell, Planets>!
    private var delegate: TableCellDelegate<UITableViewCell>?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.showDefaultActivityIndicator()
        viewModel.onErrorHandling = { [weak self] error in
            self?.view.hideDefaultActivityIndicator()
            self?.showAlert(msg: StarWarsConstants.Texts.errorMessage)
        }

        loadData()
        updatenavigationTitle()

    }
}

// MARK: - Custom methods

extension ListViewController {

    private func loadData() {
        viewModel.fetchData { [weak self] _ in
            DispatchQueue.main.async {
                self?.view.hideDefaultActivityIndicator()
                self?.updateDataSource()
                self?.listTableView.dataSource = self?.dataSource
                self?.listTableView.delegate = self?.delegate
                self?.listTableView.reloadData()
                self?.updatenavigationTitle()
            }
        }
    }

    private func updateDataSource() {

        dataSource = TableCellDataSource(cellIdentifier: StoryboardIds.listViewCell,
                                         items: viewModel.planetFromCoreData,
                                         configureCell: { (cell, data, index) in
            (cell as? ListViewCell)?.data = data
            (cell as? ListViewCell)?.titleLabel.text = "\(index + 1)".planetString
        })

        delegate = TableCellDelegate(cellIdentifier: StoryboardIds.listViewCell)

        delegate?.didSelect = { selectedIndex in
            self.viewModel.selectItem(index: selectedIndex) { [weak self] result in
                if result == nil {
                    self?.showAlert(msg: StarWarsConstants.Texts.noDsta)
                } else {
                    self?.performSegue(withIdentifier: StoryboardIds.showDetailSegue, sender: self)
                }
            }
        }

    }

    func updatenavigationTitle() {
        title = viewModel.navigationTitle
    }

}

// MARK: - Navigation

extension ListViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardIds.showDetailSegue {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.viewModel.item = viewModel.selectedItem
            }
        }
    }
}
