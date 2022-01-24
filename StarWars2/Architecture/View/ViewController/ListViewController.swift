//
//  ListViewController.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    fileprivate var activityIndicator: ActivityIndicator = ActivityIndicator()
    lazy var viewModel: ListViewModelProtocol = {
        let viewModel = ListViewModel()
        return viewModel
    }()
    private var dataSource : TableCellDataSource<UITableViewCell, PlanetModel?>!
    private var delegate : TableCellDelegate<UITableViewCell>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.start()
        viewModel.fetchData { [weak self] _ in
            self?.activityIndicator.stop()
            DispatchQueue.main.async {
                self?.updateDataSource()
                self?.listTableView.dataSource = self?.dataSource
                self?.listTableView.delegate = self?.delegate
                self?.listTableView.reloadData()
            }
        }
        
    }
}


//MARK: - Custom methods

extension ListViewController {
    
    private func updateDataSource() {
        
        dataSource = TableCellDataSource(cellIdentifier: StoryboardIds.listViewCell,
                                         items: viewModel.data,
                                         configureCell: { (cell, data, index) in
            (cell as? ListViewCell)?.data = data
        })

        delegate = TableCellDelegate(cellIdentifier: StoryboardIds.listViewCell)
        
        delegate.didSelect = { i in
            self.performSegue(withIdentifier: StoryboardIds.showDetailSegue, sender: self)
        }
        
        viewModel.onErrorHandling = { [weak self] error in
            self?.activityIndicator.stop()
            self?.showAlert(msg: StarWarsConstants.Texts.errorMessage)
        }
        
    }

}

//MARK: - Navigation

extension ListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardIds.showDetailSegue {
            if let vc = segue.destination as? DetailViewController {
                
            }
        }
    }
}

