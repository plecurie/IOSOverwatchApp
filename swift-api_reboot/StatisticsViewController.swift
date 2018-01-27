//
//  StatisticsViewController.swift
//  swift-api_reboot
//
//  Created by Prescilla Lecurieux on 23/01/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var db = DbConnect()
    
    @IBOutlet var infoLabel: UILabel!
    var selectedPlayer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStats()
    }
    
    func displayStats() {
        let player = db.getStats(tag: selectedPlayer!)
        print(player.tag as Any)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        self.infoLabel.text = self.selectedPlayer
    }
    
}

