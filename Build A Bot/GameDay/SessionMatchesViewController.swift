//
//  SessionMatchesViewController.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/1/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class SessionMatchesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var matchList = [String]()
    var pointList = [String]()
    var teamList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = selectedSession
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        
        databaseHandle = ref?.child("gameDay").child(selectedSession).child("matches").observe(.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.matchList.removeAll()
                self.pointList.removeAll()
                self.teamList.removeAll()
                
                for match in snapshot.children.allObjects as! [DataSnapshot] {
                    if let matchDetails = match.value as? [String: AnyObject] {
                        let matchNumber = matchDetails["matchNumber"] as? String
                        let pointValue = matchDetails["matchPoints"] as? String
                        let teamName = matchDetails["teamName"] as? String
                        
                        self.matchList.append(matchNumber!)
                        self.pointList.append(pointValue!)
                        self.teamList.append(teamName!)
                    }
                }
                
                self.tableView.reloadData()
            }
                
            else {
                self.matchList.removeAll()
                self.pointList.removeAll()
                self.teamList.removeAll()
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! PastMatchesTableViewCell
        
        cell.matchNumber.text = matchList[indexPath.row]
        cell.matchPoints.text = pointList[indexPath.row]
        cell.teamName.text = teamList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMatch = matchList[indexPath.row]
        performSegue(withIdentifier: "toBreakdown", sender: self)
    }

}
