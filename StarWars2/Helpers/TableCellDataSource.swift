//
//  TableCellDataSource.swift
//  StarWars2
//
//  Created by Devashree KS on 23/01/22.
//

import Foundation
import UIKit

class TableCellDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource {
    
    // MARK: - Variables
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T, Int) -> () = {_,_,_ in }
    let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 31))
    
    
    // MARK: - Overrides
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T, Int) -> ()) {
       
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    
    }
    
    
    // MARK: - Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        items.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let item = self.items[indexPath.row]
        self.configureCell(cell as! CELL, item, indexPath.row)
        return cell
        
    }
    
}

