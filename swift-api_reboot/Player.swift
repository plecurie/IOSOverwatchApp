//
//  Player.swift
//  swift-api_reboot
//
//  Created by Prescilla Lecurieux on 14/01/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import Foundation

class Player {
    
    var id: Int
    var tag: String?
    var platform : String?
    var region : String?
    var rank: Int?
    var portrait: String?

    init(id: Int, tag: String?, platform: String?, region: String?, rank: Int?, portrait: String?){
        self.id = id
        self.tag = tag
        self.platform = platform
        self.region = region
        self.rank = rank
        self.portrait = portrait
    }
}

