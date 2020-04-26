//
//  CharactersCell.swift
//  GotAPIDifferent
//
//  Created by Ivo Specht on 26/04/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

import UIKit

class CharactersCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aliasLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
