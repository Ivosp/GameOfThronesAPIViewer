//
//  BooksCell.swift
//  GotAPIDifferent
//
//  Created by Ivo Specht on 25/04/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

import UIKit

class BooksCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var pageNumberLabel: UILabel!
    @IBOutlet weak var ISBNLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
