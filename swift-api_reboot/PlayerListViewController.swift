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
        
        self.tableViewPlayer.delegate = self
        self.tableViewPlayer.dataSource = self
        
        self.title = "Registered Players"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(touchEditButton))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(touchPreviousButton))
        
        self.tableViewPlayer.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerInfo")
        
    }
    
    func readPlayerList() {
        playerList = db.getList()
        self.tableViewPlayer.reloadData()
    }
    
    public func getPlayerList() -> [Player] {
        return playerList;
    }
    
    @IBAction func touchEditButton() {
        self.tableViewPlayer.isEditing = !self.tableViewPlayer.isEditing
    }
    
    @IBAction func touchPreviousButton(){
        self.navigationController?.pushViewController(AccountViewController(), animated: true)
    }
}

extension PlayerListViewController: UITableViewDelegate {
    
    //Editer
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.playerList.remove(at: indexPath.row)
            self.tableViewPlayer.reloadSections([0], with: .automatic)
        }
    }
    
    //Déplacer
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let res = self.playerList.remove(at: sourceIndexPath.row)
        self.playerList.insert(res, at: destinationIndexPath.row)
    }
    
    //Sélectionner
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerTag = self.playerList[indexPath.row].tag
        print("click on: \(String(describing: playerTag))")
    }
    
    //Désélectionner
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let playerTag = self.playerList[indexPath.row].tag
        let profileViewController = ProfileViewController()
        profileViewController.selectedPlayer = playerTag
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
}

extension PlayerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerInfo", for: indexPath)
        
        if let playerCell = cell as? PlayerTableViewCell {
            let player = self.playerList[indexPath.row]
            
            playerCell.tagLabel.text = player.tag
            playerCell.rankLabel.text = String(describing: player.rank)
            
        } else {
            print("Error: cannot build the cell !")
        }
        
        /*
         let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
         let player : Player
         player = self.playerList[indexPath.row]
         cell.textLabel?.text = player.tag
         */
        
        return cell
    }
}


