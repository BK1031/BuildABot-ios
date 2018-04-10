//
//  CurrentMatchViewController.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/1/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class CurrentMatchViewController: UITableViewController {
    
    @IBOutlet weak var matchNumberLabel: UILabel!
    
    @IBOutlet weak var matchPointsLabel: UILabel!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        databaseHandle = ref?.child("gameDay").child(selectedSession).child("current").observe(.value, with: { (snapshot) in
            if snapshot.hasChildren() {
                for match in snapshot.children.allObjects as! [DataSnapshot] {
                    if let matchData = match.value as? [String: AnyObject] {
                        let matchNumber = matchData["matchNumber"] as? String
                        let points = matchData["matchPoints"] as? String
                        let teamName = matchData["teamName"] as? String
                        
                        self.matchNumberLabel.text = matchNumber
                        self.matchPointsLabel.text = points
                        self.teamNameLabel.text = teamName
                    }
                }
            }
            else {
                self.matchNumberLabel.text = "N/A"
                self.matchPointsLabel.text = "N/A"
                self.teamNameLabel.text = "No Current Match"
            }
        })
    }

}
