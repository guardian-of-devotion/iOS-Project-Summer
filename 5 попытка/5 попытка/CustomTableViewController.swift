//
//  CustomTableViewController.swift
//  5 попытка
//
//  Created by StDismas on 13.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit
 protocol CustomTableViewCellDelegate: AnyObject {
 
    func didPressAction(with user: Medicament)
    
}
    

class CustomTableViewController: UITableViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
