//
//  HomeViewController.swift
//  TechStoreApp
//
//  Created by kingSemih on 28.06.2023.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableViewInstance: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableParams()
       initUserDefault()
    }
    
    func initUserDefault(){
        if let data:[String:String] = StoreManager.shared.read(key: StorageKeys.users) as? [String:String] {
            IRepo.shared.products = data
            tableViewInstance.reloadData()
        }
    }
    
    fileprivate func initTableParams(){
        tableViewInstance.delegate = self
        tableViewInstance.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IRepo.shared.products.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
        cell.textLabel?.text = Array(IRepo.shared.products.keys)[indexPath.row]
        return cell
    }
    

   
    
    @IBAction func addBarButtonAction(_ sender: UIBarButtonItem) {
        let alertCtrl:UIAlertController = UIAlertController(title: "Add New Item", message: "Please Enter New Item Params", preferredStyle: UIAlertController.Style.alert)
        alertCtrl.addTextField { action in
            action.placeholder = "Enter Item Name"
        }
        let addButton:UIAlertAction = UIAlertAction(title: "Add", style: UIAlertAction.Style.default,handler: {action in
            if(alertCtrl.textFields?.first?.text != nil) {self.addNewItem(productName: alertCtrl.textFields!.first!.text!)}
        })
        alertCtrl.addAction(addButton)
        present(alertCtrl, animated: true)
    }
    
    fileprivate func addNewItem(productName:String) {
        IRepo.shared.products[productName] = "None"
        let indexpath : IndexPath = IndexPath(row: IRepo.shared.products.keys.count-1, section: 0)
        self.tableViewInstance.insertRows(at: [indexpath], with: UITableView.RowAnimation.left)
        self.tableViewInstance.reloadData()
        StoreManager.shared.save(value: IRepo.shared.products, key: StorageKeys.users)
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableViewInstance.setEditing(editing, animated: animated)
    }
    
    
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        tableViewInstance.isEditing.toggle()
    }
    
    func tableView(_ tableView:UITableView,commit editingStyle: UITableViewCell.EditingStyle ,forRowAt indexPath:IndexPath){
        if editingStyle == .delete{
            IRepo.shared.products.removeValue(forKey: Array(IRepo.shared.products.keys)[indexPath.row])
            tableViewInstance.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
            StoreManager.shared.save(value: IRepo.shared.products, key: StorageKeys.users)
        }
    }
}
