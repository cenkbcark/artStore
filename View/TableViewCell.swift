//
//  TableViewCell.swift
//  artStore
//
//  Created by Cenk Bahadır Çark on 24.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
