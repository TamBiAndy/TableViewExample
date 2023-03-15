//
//  ColorTableViewCell.swift
//  TableViewExample
//
//  Created by Andy on 15/03/2023.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    @IBOutlet weak var ColorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
