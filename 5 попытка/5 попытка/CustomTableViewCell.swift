//
//  CustomTableViewCell.swift
//  5 попытка
//
//  Created by StDismas on 13.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {

    func didPressAction(with user: Medicament)}

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var FirstTitleLabel: UILabel!
     weak var delegate: CustomTableViewCellDelegate?
       
       var currentUser: Medicament!
    
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           FirstTitleLabel.font = .boldSystemFont(ofSize: 21)
       }
       
       
       func configure(with user: Medicament) {
           
           currentUser = user
           FirstTitleLabel.text = user.nameofMedicament
           FirstTitleLabel.sizeToFit()
       }
       
       @IBAction func didPressAction(_ sender: Any) {
           delegate?.didPressAction(with: currentUser)
       }
}
