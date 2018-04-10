//
//  PastMatchesTableViewCell.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/2/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit

class PastMatchesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var matchNumber: UILabel!
    
    @IBOutlet weak var matchPoints: UILabel!
    
    @IBOutlet weak var teamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
