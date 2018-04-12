//
//  AnnouncementsTableViewCell.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/12/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit

class AnnouncementsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var details: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
