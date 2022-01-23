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
