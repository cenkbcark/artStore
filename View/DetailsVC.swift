//
//  DetailsVC.swift
//  artStore
//
//  Created by Cenk Bahadır Çark on 22.07.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var bookPrice: UILabel!
    @IBOutlet weak var infoText: UITextView!
    
    var selectedBook : Books?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bookImage.image = selectedBook?.bookImageName
        bookName.text = selectedBook?.bookName
        bookAuthor.text = selectedBook?.bookAuthor
        bookPrice.text = "\(selectedBook?.bookPrice ?? 0) $"
        bookYear.text = "\(selectedBook?.bookYear ?? 0) "
        

        
    }
}
