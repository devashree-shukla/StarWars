//
//  DetailViewController.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    
    private let details = ["Planets", "Films"]
    private var dataSource : TableCellDataSource<UITableViewCell, String?>!
    private var delegate : TableCellDelegate<UITableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDataSource()
    }

}


extension DetailViewController {
    
    private func updateDataSource() {
        
        dataSource = TableCellDataSource(cellIdentifier: StoryboardIds.detailRowViewCell,
                                         items: details,
                                         configureCell: { (cell, data, index) in
        })
        
        delegate = TableCellDelegate(cellIdentifier: StoryboardIds.detailRowViewCell)
        
        DispatchQueue.main.async {
            self.detailTableView.dataSource = self.dataSource
            self.detailTableView.delegate = self.delegate
            self.detailTableView.reloadData()
        }
        
    }
    
}
