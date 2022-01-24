//
//  ListViewController.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    lazy var viewModel: ListViewModelProtocol = {
        let viewModel = ListViewModel()
        return viewModel
    }()
    private var dataSource : TableCellDataSource<UITableViewCell, PlanetListModel?>!
    private var delegate : TableCellDelegate<UITableViewCell>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.showDefaultActivityIndicator()
        viewModel.onErrorHandling = { [weak self] error in
            self?.view.hideDefaultActivityIndicator()
            self?.showAlert(msg: StarWarsConstants.Texts.errorMessage)
        }
        viewModel.fetchData { [weak self] _ in
            self?.view.hideDefaultActivityIndicator()
            DispatchQueue.main.async {
                self?.updateDataSource()
                self?.listTableView.dataSource = self?.dataSource
                self?.listTableView.delegate = self?.delegate
                self?.listTableView.reloadData()
                self?.updatenavigationTitle()
            }
        }
    }
}


//MARK: - Custom methods

extension ListViewController {
    
    private func updateDataSource() {
        
        dataSource = TableCellDataSource(cellIdentifier: StoryboardIds.listViewCell,
                                         items: viewModel.planetArray,
                                         configureCell: { (cell, data, index) in
            (cell as? ListViewCell)?.data = data?.planets
            (cell as? ListViewCell)?.titleLabel.text = "\(index + 1)".planetString
        })

        delegate = TableCellDelegate(cellIdentifier: StoryboardIds.listViewCell)
        
        delegate.didSelect = { i in
            self.performSegue(withIdentifier: StoryboardIds.showDetailSegue, sender: self)
        }
        
    }
    
    
    func updatenavigationTitle() {
        title = viewModel.navigationTitle
    }

}

//MARK: - Navigation

extension ListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardIds.showDetailSegue {
            if let vc = segue.destination as? DetailViewController, let index = listTableView.indexPathForSelectedRow?.row {
                vc.viewModel.item = viewModel.planetArray[index]
            }
        }
    }
}

