//
//  HomeViewController.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    let starWarsItems = ["Planets", "Films"]
    private var dataSource : TableCellDataSource<UITableViewCell, String?>!
    private var delegate : TableCellDelegate<UITableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDataSource()
    }
    
}

//MARK: - Custom methods

extension HomeViewController {
    
    private func updateDataSource() {
        
        dataSource = TableCellDataSource(cellIdentifier: StoryboardIds.homeViewCell,
                                         items: starWarsItems,
                                         configureCell: { (cell, data, index) in
            (cell as? HomeViewCell)?.data = data
        })
        
        delegate = TableCellDelegate(cellIdentifier: StoryboardIds.homeViewCell)
        
        delegate.didSelect = { i in
            self.performSegue(withIdentifier: StoryboardIds.showListSegue, sender: self)
        }
        
        DispatchQueue.main.async {
            self.homeTableView.dataSource = self.dataSource
            self.homeTableView.delegate = self.delegate
            self.homeTableView.reloadData()
        }
        
    }

}

//MARK: - Navigation

extension HomeViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            
        }
    }
}