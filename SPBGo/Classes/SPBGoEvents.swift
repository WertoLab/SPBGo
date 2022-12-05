//
//  SPBGoEvents.swift
//  SPBGo
//
//  Created by Andrey on 03.12.2022.
//

import Foundation
class SPBGoEvents:Decodable{
    var event: SPBGoEvent
    init(_ event:SPBGoEvent){
        self.event = event
    }
}
