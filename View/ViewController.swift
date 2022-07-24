//
//  ViewController.swift
//  artStore
//
//  Created by Cenk Bahadır Çark on 22.07.2022.
//

import UIKit

var bookList = [Books]()
var totalCost : Double = 0.0
var chosenBook : Books?
var searching = false
var shoppedBookList = [Books]()



class ViewController: UIViewController {

    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var bookCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        
        searchBar.delegate = self
        
        let book1 = Books(bookID: 1, bookImageName: UIImage(named: "lotr1")!, bookName: "Lord of The Rings: The Fellowship of The Ring", bookPrice: 11.99, bookAuthor: "J.R.R Tolkien", bookYear: 1954)
        let book2 = Books(bookID: 2, bookImageName: UIImage(named: "lotr2")!, bookName: "Lord of The Rings: Two Tower", bookPrice: 12.99, bookAuthor: "J.R.R Tolkien", bookYear: 1954)
        let book3 = Books(bookID: 3, bookImageName: UIImage(named: "lotr3")!, bookName: "Lord of The Rings: Return of The King", bookPrice: 13.99, bookAuthor: "J.R.R Tolkien", bookYear: 1954)
        let book4 = Books(bookID: 4, bookImageName: UIImage(named: "hp1")!, bookName: "Harry Potter and the Philosopher's Stone", bookPrice: 9.99, bookAuthor: "J.K Rowling", bookYear: 1997)
        let book5 = Books(bookID: 5, bookImageName: UIImage(named: "hp2")!, bookName: "Harry Potter and the Chamber of Secrets", bookPrice: 10.99, bookAuthor: "J.K Rowling", bookYear: 1998)
        let book6 = Books(bookID: 6, bookImageName: UIImage(named:"hp3")!, bookName: "Harry Potter and the Prisoner of Azkaban", bookPrice: 11.99, bookAuthor: "J.K Rowling", bookYear: 1998)
        let book7 = Books(bookID: 7, bookImageName: UIImage(named: "hp4")!, bookName: "Harry Potter and the Goblet of Fire", bookPrice: 12.99, bookAuthor: "J.K Rowling", bookYear: 2000)
        let book8 = Books(bookID: 8, bookImageName: UIImage(named: "hp5")!, bookName: "Harry Potter and the Order of the Phoenix", bookPrice: 13.99, bookAuthor: "J.K Rowling", bookYear: 2003)
        let book9 = Books(bookID: 9, bookImageName: UIImage(named: "hp6")!, bookName: "Harry Potter and the Half-Blood Prince", bookPrice: 14.99, bookAuthor: "J.K Rowling", bookYear: 2005)
        let book10 = Books(bookID: 10, bookImageName: UIImage(named: "hp7")!, bookName: "Harry Potter and the Deathly Hallows", bookPrice: 15.99, bookAuthor: "J.K Rowling", bookYear: 2007)
        let book11 = Books(bookID: 11, bookImageName: UIImage(named: "hobbit1")!, bookName: "Hobbit", bookPrice: 7.99, bookAuthor: "J.R.R Tolkien", bookYear: 1937)
        
        bookList.append(book1)
        bookList.append(book2)
        bookList.append(book3)
        bookList.append(book4)
        bookList.append(book5)
        bookList.append(book6)
        bookList.append(book7)
        bookList.append(book8)
        bookList.append(book9)
        bookList.append(book10)
        bookList.append(book11)
        
        
    }

    @IBAction func goShopping(_ sender: Any) {
        
        performSegue(withIdentifier: "toShoppingVC", sender: nil)
        
    }
    
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource
,BookTableViewCellProtocol{
    func addList(indexpath: IndexPath) {
        let arrivedBook = bookList[indexpath.row]
        totalCost += arrivedBook.bookPrice!
        totalCostLabel.text = "Total: \(totalCost ) $"
        shoppedBookList.append(arrivedBook) //add book to shopping list
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return bookList.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let book = bookList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as! BookCell
        
        cell.layer.cornerRadius = 25.0
        
        if searching{
           // cell.bookNameLabel.text = searchingBookList[indexPath.row]

        }else{
            cell.bookImage.image = book.bookImageName
            cell.priceLabel.text = "\(book.bookPrice ?? 0) $"
            cell.bookNameLabel.text = book.bookName
        }
        
        
        cell.bookTableViewProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenBook = bookList[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedBook = chosenBook
        }
        if segue.identifier == "toShoppingVC"{
            let destinationVC = segue.destination as! ShoppingVC
            destinationVC.boughtBookList = shoppedBookList
        }
    }

}
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        print ("arama sonucu: \(searchText)")
        //bookCollectionView.reloadData()
        
    }
}
