//
//  SPBGoEvent.swift
//  SPBGo
//
//  Created by Andrey on 03.12.2022.
//

import Foundation
class SPBGoEvent:Decodable{
    var image: String
    var title: String
    var description:String
    var place:String
    var date:String
    var is_free:Bool
    var weekday:String
    init(_ id:Int,_ title:String,_ slug:String,_ image:String,_ description:String,_ place:String,_ date:String,_ is_free:Bool,_ weekday:String){
        self.title = title
        self.image = image
        self.description = description
        self.place = place
        self.date = date
        self.is_free = is_free
        self.weekday = weekday
    }
}
