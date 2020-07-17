//
//  DetaillViewController.swift
//  5 попытка
//
//  Created by StDismas on 13.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit

class DetaillViewController: UIViewController {

   
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var textLable: UILabel!
    var newText: String?
    var newText2: String?
        override func viewDidLoad() {
            super.viewDidLoad()
            Label2.text=newText2
            Label2.sizeToFit()
            textLable.text = newText
            textLable.sizeToFit()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         let vc = segue.destination as! DataViewController
        vc.newText3 = textLable.text
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
