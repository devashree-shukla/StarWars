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
    private var dataSource : TableCellDataSource<DetailRowViewCell, [String: Any]>!
    private var delegate : TableCellDelegate<UITableViewCell>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDataSource()
        title = viewModel.item?.planets.name
    }

}


extension DetailViewController {
    
    private func updateDataSource() {
        dataSource = TableCellDataSource(cellIdentifier: StoryboardIds.detailRowViewCell,
                                         items: viewModel.items!,
                                         configureCell: { (cell, data, index) in
            cell.data = data
            if cell.titleLabel.text == "Films" {
                cell.descriptionLabel.text = self.viewModel.item?.films?.description
            } else if cell.titleLabel.text == "Residents" {
                cell.descriptionLabel.text = self.viewModel.item?.residents?.description
            }
        })
        
        delegate = TableCellDelegate(cellIdentifier: StoryboardIds.detailRowViewCell)
        
        DispatchQueue.main.async {
            self.detailTableView.dataSource = self.dataSource
            self.detailTableView.delegate = self.delegate
            self.detailTableView.reloadData()
        }
        
    }
    
}
 
