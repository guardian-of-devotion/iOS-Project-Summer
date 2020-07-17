//
//  ProfileViewController.swift
//  5 попытка
//
//  Created by StDismas on 16.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit

struct Key {
    static let keyname = "name"
     static let keyheight = "height"
     static let keyweight = "weight"
     static let keyage  = "age"
    
}

class ProfileViewController: UIViewController {
    let defaults = UserDefaults.standard

    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var Weight: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        Height.text = defaults.string(forKey: Key.keyheight)
         Name.text = defaults.string(forKey: Key.keyname)
         Weight.text = defaults.string(forKey: Key.keyweight)
        Age.text = defaults.string(forKey: Key.keyage)

        
    }

    @IBAction func saveActoin(_ sender: Any) {
        let name =  Name.text!
        let height = Height.text!
        let weight =  Weight.text!
        let age = Age.text!
        if !name.isEmpty && !height.isEmpty && !weight.isEmpty && !age.isEmpty{
            defaults.set(name, forKey: Key.keyname)
            defaults.set(height, forKey: Key.keyheight)
            defaults.set(weight, forKey: Key.keyweight)
            defaults.set(age, forKey: Key.keyage)
        }
    }
}
