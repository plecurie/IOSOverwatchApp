//
//  ApiConnect.swift
//  swift-api_reboot
//
//  Created by Prescilla Lecurieux on 11/01/2018.
//  Copyright © 2018 Prescilla Lecurieux. All rights reserved.
//

import Foundation

class ApiConnect {
    
    func getProfile(id: Int,tag: String, platform: String, region: String) -> Player {
        
        var rank = 10
        var portrait = ""
        var player = Player(id: Int(id), tag: String(describing: tag), platform: String(describing: platform), region: String(describing: region), rank: Int(rank), portrait: String(describing: portrait))
        
        
        let path = "http://127.0.0.1:3000/profile/" + platform + "/" + region + "/" + tag
        
        if let jsonURL = URL(string: path) {
            let task = URLSession.shared.dataTask(with: jsonURL) { (data, res, err) in
                guard let responseData = data else {
                    return
                }
                guard let json = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments),
                    let dict = json as? [String: Any]
                    else {
                        return
                }
                
                if !dict.isEmpty {
                    rank = (dict["level"] as? Int)!
                    portrait = (dict["portrait"] as? String)!
                    
                    player = Player(id: Int(id), tag: String(describing: tag), platform: String(describing: platform), region: String(describing: region), rank: Int(rank), portrait: String(describing: portrait))
                }
                print(rank)
            }
            task.resume()
        }
        return player
    }
    
    func getStats(id: Int, tag: String, platform: String, region: String) -> Player {
        
        var rank = 10
        var portrait = ""
        var player = Player(id: Int(id), tag: String(describing: tag), platform: String(describing: platform), region: String(describing: region), rank: Int(rank), portrait: String(describing: portrait))
        
        let path = "http://0.0.0.0:3000/stats/" + platform + "/" + region + "/" + tag
        if let jsonURL = URL(string: path) {
            let task = URLSession.shared.dataTask(with: jsonURL) { (data, res, err) in
                guard let responseData = data else {
                    return
                }
                guard let json = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments),
                    let dict = json as? [String: Any]
                    else {
                        return
                }
                
                if !dict.isEmpty {
                    rank = (dict["level"] as? Int)!
                    portrait = (dict["portrait"] as? String)!
                    
                    player = Player(id: Int(id), tag: String(describing: tag), platform: String(describing: platform), region: String(describing: region), rank: Int(rank), portrait: String(describing: portrait))
                }
            }
            task.resume()
        }
        return player
    }
    
}


