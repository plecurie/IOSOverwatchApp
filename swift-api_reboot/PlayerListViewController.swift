//
//  PlayerListViewController.swift
//  swift-api_reboot
//
//  Created by Prescilla Lecurieux on 14/01/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import UIKit

class PlayerListViewController: UIViewController {
    
    @IBOutlet var tableViewPlayer: UITableView!
    
    private var playerList = [Player]()
    private var platformList:[UISwitch] = []
    private var regionList:[UISwitch] = []
    var db = DbConnect()
    var api = ApiConnect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db.initDB()
        readPlayerList()
    }
    
    func readPlayerList() {
        playerList = db.getList()
        self.tableViewPlayer.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let player: Player
        player = playerList[indexPath.row]
        cell.textLabel?.text = player.tag
        return cell
    }
}

