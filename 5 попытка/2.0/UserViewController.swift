//
//  UserViewController.swift
//  5 попытка
//
//  Created by StDismas on 15.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    let idCell = "UserCell"
    var model = UserModule()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search

        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let Delate = UIContextualAction(style: .normal, title: "Delate") { (action, view,success)
            in print("Delate")
        }
        Delate.backgroundColor = #colorLiteral(red: 1, green: 0.05663648117, blue: 0.09848636654, alpha: 1)
        return UISwipeActionsConfiguration()
    }

    
}
extension UserViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! UserTableViewCell
        let user = model.users[indexPath.row]
        cell.FromLable.text = user.name
        cell.subjectLable.text = user.detail
        return cell
    }
    
}
extension UserViewController:UISearchResultsUpdating{
    func  updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text)
    }
}
