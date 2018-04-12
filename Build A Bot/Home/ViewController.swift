//
//  ViewController.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/1/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var titleList = [String]()
    var detailList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        
        databaseHandle = ref?.child("announcements").child(selectedSession).observe(.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.titleList.removeAll()
                self.detailList.removeAll()
                
                for announcement in snapshot.children.allObjects as! [DataSnapshot] {
                    if let announcementDetails = announcement.value as? [String: AnyObject] {
                        self.titleList.append(announcementDetails["title"] as! String)
                        self.detailList.append(announcementDetails["detail"] as! String)
                    }
                }
                
                self.tableView.reloadData()
            }
            
            else {
                self.titleList.removeAll()
                self.detailList.removeAll()
                self.tableView.reloadData()
            }
            
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! AnnouncementsTableViewCell
        
        cell.title.text = titleList[indexPath.row]
        cell.details.text = detailList[indexPath.row]
        cell.cellView.layer.cornerRadius = 10
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAnnouncement = titleList[indexPath.row]
        //TODO: Add segue to announcement view
    }
    
    @IBAction func filterButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "filter", sender: self)
    }
    
}

