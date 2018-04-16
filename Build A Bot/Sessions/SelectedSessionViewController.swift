//
//  SelectedSessionViewController.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/12/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit

class SelectedSessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
        self.navigationItem.title = selectedSession
    }

}
