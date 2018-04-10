//
//  MatchBreakdownViewController.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/2/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit

class MatchBreakdownViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Match " + selectedMatch
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
    }
    
}
