//
//  StorageManagert.swift
//  TechStoreApp
//
//  Created by kingSemih on 28.06.2023.
//

import Foundation



class StoreManager{
    private init(){}
    static let shared:StoreManager = StoreManager()
    
    
     func save(value:Any?,key:StorageKeys){
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
      func read(key:StorageKeys)->Any?{
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
}
