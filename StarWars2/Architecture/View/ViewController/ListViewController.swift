//
//  ListViewController.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    private let planets = ["Planets", "Films"]
    private var dataSource : TableCellDataSource<UITableViewCell, String?>!
    private var delegate : TableCellDelegate<UITableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PeopleRouter().fetchConverter { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    print(result)
//                    if let results = converter.results {
//                        self?.dataSource?.data.value = results
//                        self?.filteredResults = self?.personHelper.parseEyeColorArray(results: results) ?? []
//                        completion?(Result.success(true))
//                    } else {
//                        self?.onErrorHandling?(ErrorResult.parser(string: "unable to parse"))
//                        completion?(Result.failure(ErrorResult.parser(string: "unable to parse")))
//                    }
                case .failure(let error) :
                    print(error)
//                    self?.onErrorHandling?(error)
//                    completion?(Result.failure(error))
                }
            }
        }
        updateDataSource()
    }

}


//MARK: - Custom methods

extension ListViewController {
    
    private func updateDataSource() {
        
        dataSource = TableCellDataSource(cellIdentifier: StoryboardIds.listViewCell,
                                         items: planets,
                                         configureCell: { (cell, data, index) in
            (cell as? HomeViewCell)?.data = data
        })
        
        delegate = TableCellDelegate(cellIdentifier: StoryboardIds.listViewCell)
        
        delegate.didSelect = { i in
            self.performSegue(withIdentifier: StoryboardIds.showDetailSegue, sender: self)
        }
        
        DispatchQueue.main.async {
            self.listTableView.dataSource = self.dataSource
            self.listTableView.delegate = self.delegate
            self.listTableView.reloadData()
        }
        
    }

}
