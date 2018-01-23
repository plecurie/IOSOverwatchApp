//
//  ApiConnect.swift
//  swift-api_reboot
//
//  Created by Prescilla Lecurieux on 11/01/2018.
//  Copyright © 2018 Prescilla Lecurieux. All rights reserved.
//

import Foundation

class ApiConnect {
    
    func searchProfile(tag: String, platform: String, region: String){
        
        let path = "http://0.0.0.0:3000/profile/" + platform + "/" + region + "/" + tag
        guard let jsonURL = URL(string: path) else {
            return
        }
        let task = URLSession.shared.dataTask(with: jsonURL) { (data, res, err) in
            guard let responseData = data else {
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments),
                let dict = json as? [String: Any]
                else {
                    return
            }
            print(dict["username"] as Any)
            print(dict["level"] as Any)
        }
        task.resume()
    }
    
    func searchStats(tag: String, platform: String, region: String){
        
        let path = "http://0.0.0.0:3000/stats/" + platform + "/" + region + "/" + tag
        guard let jsonURL = URL(string: path) else {
            return
        }
        let task = URLSession.shared.dataTask(with: jsonURL) { (data, res, err) in
            guard let responseData = data else {
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments),
                let dict = json as? [String: Any]
                else {
                    return
            }
            print(dict["username"] as Any)
            print(dict["level"] as Any)
        }
        task.resume()
    }
    
}


