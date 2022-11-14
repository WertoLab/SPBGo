//
//  Event.swift
//  SPBGo
//
//  Created by Andrey on 05.11.2022.
//
import Foundation
class Event :Decodable{
    var id: Int
    var title: String
    var slug: String
    init(_ id:Int,_ title:String,_ slug:String){
        self.id = id
        self.title = title
        self.slug = slug
    }
}
