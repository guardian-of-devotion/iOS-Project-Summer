//
//  Base.swift
//  5 попытка
//
//  Created by StDismas on 16.07.2020.
//  Copyright © 2020 StDismas. All rights reserved.
//

import Foundation

class Base{
    let defaults = UserDefaults.standard
    static let shared = Base()
    struct  UserSave:Codable {
        var name:String
        var time:String
        var full:String{
            return "\(name), \(time)"
        }
    }
    var save:[UserSave]{
        get{
            if let data = defaults.value(forKey: "user") as? Data{
               return try! PropertyListDecoder().decode([UserSave].self, from: data)
            }else{
                return [UserSave]()
            }
        }
        set{
          if   let data = try? PropertyListEncoder().encode(newValue){
                defaults.set(data, forKey: "user")
            }
        }
    }
    func saveSave(name:String,time:String){
        let add = UserSave(name: name, time: time)
        save.insert(add, at: 0)
    }
}
