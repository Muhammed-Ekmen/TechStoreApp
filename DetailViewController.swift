//
//  DetailViewController.swift
//  TechStoreApp
//
//  Created by kingSemih on 28.06.2023.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var textViewInstance: UITextView!
    var descriptionMessage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewInstance.text = descriptionMessage
    }
    
    func getDescription(description:String){
        descriptionMessage = description
        if isViewLoaded {textViewInstance.text = descriptionMessage}
    }
}
