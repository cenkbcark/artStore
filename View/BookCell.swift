//
//  BookCell.swift
//  artStore
//
//  Created by Cenk Bahadır Çark on 22.07.2022.
//

import UIKit

protocol BookTableViewCellProtocol{
    func addList(indexpath: IndexPath)
}

var detailsVCSegue : Bool?

class BookCell: UICollectionViewCell {
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bookNameLabel: UILabel!
    
    var bookTableViewProtocol : BookTableViewCellProtocol?
    var indexPath : IndexPath?
    
    @IBAction func addButton(_ sender: Any) {
        bookTableViewProtocol?.addList(indexpath: indexPath!)
        
    }
}



