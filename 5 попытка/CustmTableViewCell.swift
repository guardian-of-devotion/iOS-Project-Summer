//
//  CustmTableViewCell.swift
//  5 попытка
//
//  Created by StDismas on 13.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit

protocol CustmTableViewCellDelegate: AnyObject {
    
    func didPressAction(with user: User)
}
class CustmTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTitleLabel: UILabel!
    weak var delegate: CustmTableViewCellDelegate?
       
       var currentUser: User!
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           firstTitleLabel.font = .boldSystemFont(ofSize: 21)
       }
       
       
       func configure(with user: User) {
           
           currentUser = user
           firstTitleLabel.text = user.nameofMedicament
           firstTitleLabel.sizeToFit()
       }
       
       @IBAction func didPressAction(_ sender: Any) {
           delegate?.didPressAction(with: currentUser)
       }
    
    }



