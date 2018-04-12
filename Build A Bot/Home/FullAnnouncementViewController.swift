//
//  FullAnnouncementViewController.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/12/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class FullAnnouncementViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var sessionLabel: UILabel!
    
    @IBOutlet weak var announcementLabel: UILabel!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Details"
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
        
        ref = Database.database().reference()
        
        databaseHandle = ref?.child("announcements").child(selectedSession).child(selectedAnnouncement).observe(.value, with: { (snapshot) in
            if let announcementDetails = snapshot.value as? [String: AnyObject] {
                self.titleLabel.text = announcementDetails["title"] as? String
                self.sessionLabel.text = selectedSession
                self.announcementLabel.text = announcementDetails["details"] as? String
            }
        })
    }

}
