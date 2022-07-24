//
//  ShoppingVC.swift
//  artStore
//
//  Created by Cenk Bahadır Çark on 24.07.2022.
//

import UIKit

class ShoppingVC: UIViewController{
    @IBOutlet weak var tableView: UITableView!

    var boughtBook : Books?
    var boughtBookList = [Books]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        
    }

}
extension ShoppingVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! TableViewCell
        
        cell.priceLabel.text = "\(boughtBookList[indexPath.row].bookPrice ?? 0) $"
        cell.nameLabel.text = boughtBookList[indexPath.row].bookName
        cell.bookIcon.image = boughtBookList[indexPath.row].bookImageName
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boughtBookList.count
    }
    
    
//"\(boughtBook?.bookPrice ?? 0) $"
    
    
}
