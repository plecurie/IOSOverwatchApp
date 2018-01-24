//
//  StatisticsViewController.swift
//  swift-api_reboot
//
//  Created by Prescilla Lecurieux on 23/01/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    var selectedText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoLabel.text = self.selectedText
        // Do any additional setup after loading the view.
    }

}
