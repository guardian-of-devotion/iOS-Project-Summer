//
//  TTableViewController.swift
//  5 попытка
//
//  Created by StDismas on 13.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit

class TTableViewController: UITableViewController {
    
    @IBOutlet weak var SomeLabel: UILabel!
    
     var dataSource: [User] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.tableFooterView = UIView()
            
            dataSource.append(User(nameofMedicament: "hhr", Howuneeddrinkpreporats: "fsdf"))
          dataSource.append(User(nameofMedicament: "fr", Howuneeddrinkpreporats: "fsdf"))
            tabBarController?.hidesBottomBarWhenPushed = true
        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            switch section {
            case 1:
                return 1
            default:
                return dataSource.count
            }
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "customIdentifier", for: indexPath) as! CustmTableViewCell
           
            let user = dataSource[indexPath.row]
            
            cell.configure(with: user)
            cell.delegate = self
            
            return cell
        }

        
        

    }

    extension TTableViewController: CustmTableViewCellDelegate {
        
        func didPressAction(with user: User) {
            performSegue(withIdentifier: "detailVC", sender: user)
        }

}
