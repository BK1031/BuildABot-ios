//
//  PastBreakdownViewController.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/2/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class BreakdownViewController: UITableViewController {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var matchPointsLabel: UILabel!
    @IBOutlet weak var timeTableViewCell: UITableViewCell!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var loopsLabel: UILabel!
    @IBOutlet weak var stoveLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var buildingBlockLabel: UILabel!
    @IBOutlet weak var blackBoxLabel: UILabel!
    @IBOutlet weak var bikeLabel: UILabel!
    @IBOutlet weak var ambulanceLabel: UILabel!
    @IBOutlet weak var chimneyLabel: UILabel!
    @IBOutlet weak var stairLabel: UILabel!
    
    @IBOutlet weak var tireLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var fieldDamageLabel: UILabel!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        if selectedCurrent == false {
            timeTableViewCell.isHidden = true
        }
        
        ref = Database.database().reference()
        
        databaseHandle = ref?.child("gameDay").child(selectedSession).child("matches").child(selectedMatch).observe(.value, with: { (snapshot) in
            if let matchData = snapshot.value as? [String: AnyObject] {
                
                let points = matchData["matchPoints"] as? String
                let team = matchData["teamName"] as? String
                let time = matchData["timeLeft"] as? String
                
                let loops = matchData["loops"] as? Int
                let stove = matchData["stove"] as? Bool
                let flag = matchData["flag"] as? Bool
                let buildingBlock = matchData["buildingBlocks"] as? Int
                let blackBox = matchData["blackBox"] as? Bool
                let bike = matchData["greenBike"] as? Bool
                let ambulance = matchData["ambulance"] as? String
                let chimney = matchData["chimney"] as? Bool
                let stairs = matchData["stairs"] as? Bool
                
                let tire = matchData["tirePenalty"] as? Int
                let power = matchData["powerPenalty"] as? Bool
                let fieldDamage = matchData["fieldDamage"] as? Int
                
                self.teamNameLabel.text = team
                self.matchPointsLabel.text = points
                self.timeLabel.text = time
                
                self.loopsLabel.text = "\(loops!) (\(loops! * 5) pts)"
                
                if stove == false {
                    self.stoveLabel.text = "No (0 pts)"
                }
                else {
                    self.stoveLabel.text = "Yes (15 pts)"
                }
                
                if flag == false {
                    self.flagLabel.text = "No (0 pts)"
                }
                else {
                    self.flagLabel.text = "Yes (10 pts)"
                }
                
                self.buildingBlockLabel.text = "\(buildingBlock!) (\(buildingBlock! * 10) pts)"
                
                if blackBox == false {
                    self.blackBoxLabel.text = "No (0 pts)"
                }
                else {
                    self.blackBoxLabel.text = "Yes (20 pts)"
                }
                
                if bike == false {
                    self.bikeLabel.text = "No (0 pts)"
                }
                else {
                    self.bikeLabel.text = "Yes (15 pts)"
                }
                
                if ambulance == "yellow" {
                    self.ambulanceLabel.text = "Yellow Zone (35 pts)"
                }
                else if ambulance == "blue" {
                    self.ambulanceLabel.text = "Light Blue Zone (40 pts)"
                }
                else {
                    self.ambulanceLabel.text = "No (0 pts)"
                }
                
                if chimney == false {
                    self.chimneyLabel.text = "No (0 pts)"
                }
                else {
                    self.chimneyLabel.text = "Yes (60 pts)"
                }
                
                if stairs == false {
                    self.stairLabel.text = "No (0 pts)"
                }
                else {
                    self.stairLabel.text = "Yes (50 pts)"
                }
                
                self.tireLabel.text = "\(tire!) (-\(tire! * 1) pts)"
                self.fieldDamageLabel.text = "\(fieldDamage!) (-\(fieldDamage! * 5) pts)"
                if power == false {
                    self.powerLabel.text = "No (-0 pts)"
                }
                else {
                    self.powerLabel.text = "Yes (-20 pts)"
                }
            }
        })
    }
    
}
