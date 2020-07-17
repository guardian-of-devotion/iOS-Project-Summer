//
//  DataViewController.swift
//  5 попытка
//
//  Created by StDismas on 15.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    struct KeyDefaults {
        static let keyname = "name"
        static let keytime = "time"
    }
    let defaults = UserDefaults.standard

    @IBOutlet weak var Medname: UILabel!
    var newText3: String?
    
    @IBOutlet weak var dateField: UITextField!
    let datePicked = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        dateField.inputView = datePicked
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexSpace,doneButton], animated: true)
        dateField.inputAccessoryView = toolBar
        datePicked.addTarget(self, action: #selector(dateChanged) , for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)

        Medname.text = newText3
        Medname.sizeToFit()
        
        
        
        
    }
   
    @objc func doneAction(){
        view.endEditing(true)
    }
    @objc func dateChanged(){
        getdatefromPicked()
    }
    @objc func tapGestureDone()
    {
        view.endEditing(true)
    }
    func getdatefromPicked(){
       let  formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateField.text = formatter.string(from: datePicked.date)
    }
    @IBAction func saveAction(_ sender: Any) {
        let name  = Medname.text!
        let time  = dateField.text!
        
        if !name.isEmpty && !time.isEmpty{
            Base.shared.saveSave(name: name, time: time)
            self.navigationController?.popViewController(animated: true )
        }
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
