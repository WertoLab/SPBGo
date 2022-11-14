//
//  Events.swift
//  SPBGo
//
//  Created by Andrey on 05.11.2022.
//

import Foundation
class Events: Decodable{
    var count: Int
    var results: [Event]
    init(_ count:Int,_ results:[Event]){
        self.count = count
        self.results = results
    }
}
