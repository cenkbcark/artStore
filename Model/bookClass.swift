//
//  bookClass.swift
//  artStore
//
//  Created by Cenk Bahadır Çark on 22.07.2022.
//

import Foundation
import UIKit

class Books {
    
    var bookID : Int?
    var bookImageName : UIImage?
    var bookName : String?
    var bookPrice : Double?
    var bookAuthor : String?
    var bookYear: Int?
    
    
    init(bookID:Int,bookImageName:UIImage,bookName:String,bookPrice:Double,bookAuthor:String,bookYear:Int){
        
        self.bookID = bookID
        self.bookImageName = bookImageName
        self.bookName = bookName
        self.bookPrice = bookPrice
        self.bookAuthor = bookAuthor
        self.bookYear = bookYear
    }
}
