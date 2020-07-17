//
//  UserTableViewCell.swift
//  5 попытка
//
//  Created by StDismas on 15.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var FromLable: UILabel!
    @IBOutlet weak var subjectLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
