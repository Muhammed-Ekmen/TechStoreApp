//
//  IRepo.swift
//  TechStoreApp
//
//  Created by kingSemih on 28.06.2023.
//

import Foundation


class IRepo{
    private init(){}
    static let shared:IRepo = IRepo()
    
    var products:[String:String] = [
        "Macbook Air" : "Computer",
        "Macbook Pro": "Computer",
        "Iphone 12" : "Phone",
        "Dell XPS" : "Computer",
        "Samsung S23" : "Phone"
    ]
    
    var rowIndex:Int?
}
