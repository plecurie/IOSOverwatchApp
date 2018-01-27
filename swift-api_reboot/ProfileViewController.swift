//
//  ProfileViewController.swift
//  swift-api_reboot
//
//  Created by Prescilla Lecurieux on 23/01/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var db = DbConnect()
    
    @IBOutlet var infoLabel: UILabel!
    var selectedPlayer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayProfile()
    }
    
    func displayProfile() {
        let player = db.getProfile(tag: selectedPlayer!)
        print(player.tag as Any)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        self.infoLabel.text = self.selectedPlayer
    }
}

