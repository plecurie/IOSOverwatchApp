//
//  DbConnect.swift
//  swift-api_reboot
//
//  Created by Prescilla Lecurieux on 20/01/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import Foundation
import SQLite3

class DbConnect {
    
    var db: OpaquePointer?
    
    func initDB() {
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("OverwatchDatabase.sqlite")
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
            print("Error : cannot open the database !")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS player (id INTEGER PRIMARY KEY AUTOINCREMENT, tag TEXT, platform TEXT, region TEXT)", nil, nil, nil) != SQLITE_OK {
            print("Error : cannot create the table !")
        }
    }
    
    func getList() -> [Player] {
        var playerList : [Player] = []
        
        let sql = "SELECT * FROM player"
        var bdd: OpaquePointer?
        
        if sqlite3_prepare(db, sql, -1, &bdd, nil) != SQLITE_OK {
            print("ERROR : SQL query failed !")
        }
        
        while(sqlite3_step(bdd) == SQLITE_ROW){
            let id = sqlite3_column_int(bdd, 0)
            let tag = String(cString: sqlite3_column_text(bdd, 1))
            let platform = String(cString: sqlite3_column_text(bdd, 2))
            let region = String(cString: sqlite3_column_text(bdd, 3))
            
            print(tag)
            
            playerList.append(Player(id: Int(id), tag: String(describing: tag), platform: String(describing: platform), region: String(describing: region)))
        }
        return playerList
    }
    
    func insert(tag: String, platform: String, region: String) {
        var bdd: OpaquePointer?
        
        let queryString = "INSERT INTO player (tag, platform, region) VALUES (?,?,?)"
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        if sqlite3_prepare(db, queryString, -1, &bdd, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(bdd, 1, tag, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding tag: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(bdd, 2, platform, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding platform: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(bdd, 3, region, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding region: \(errmsg)")
            return
        }
        
        if sqlite3_step(bdd) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting player: \(errmsg)")
            return
        }
    }
}

