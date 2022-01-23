//
//  HomeViewController.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
//    var homeViewModel: HomeViewModel?
    let starWarsItems = ["Planets", "Films"]
    private var dataSourceNews : TableCellDataSource<UITableViewCell, String?>!
    private var delegateNews : TableCellDelegate<UITableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDataSource()
    }
    
}

//MARK: - Custom methods

extension HomeViewController {
    
    private func updateDataSource() {
        
        dataSourceNews = TableCellDataSource(cellIdentifier: StoryboardIds.homeViewCell, items: starWarsItems, configureCell: { (cell, data, index) in
            (cell as? HomeViewCell)?.data = data
        })
        
        delegateNews = TableCellDelegate(cellIdentifier: StoryboardIds.homeViewCell)
        
        DispatchQueue.main.async {
            self.homeTableView.dataSource = self.dataSourceNews
            self.homeTableView.delegate = self.delegateNews
            self.homeTableView.reloadData()
        }
        
    }

}


////MARK: - UITableViewDataSource, UITableViewDelegate
//
//extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return starWarsItems.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIds.homeViewCell,
//                                                 for: indexPath) as! HomeViewCell
//        return cell
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        0.0001
//    }
//
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
//
//}
