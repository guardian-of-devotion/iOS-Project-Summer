//
//  SaveViewController.swift
//  5 попытка
//
//  Created by StDismas on 16.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!{
        didSet{
            tableview?.delegate = self
            tableview?.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableview.reloadData()
    }
    

    

}
extension SaveViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Base.shared.save.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        if  let dcell = tableView.dequeueReusableCell(withIdentifier: "dcell") {
            cell = dcell
        }else{
            cell = UITableViewCell()
        }
        cell.textLabel!.text = Base.shared.save[indexPath.row].full
        return cell
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

