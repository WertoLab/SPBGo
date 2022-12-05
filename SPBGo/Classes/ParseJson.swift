//
//  ParseJson.swift
//  SPBGo
//
//  Created by Andrey on 11.11.2022.
//

import Foundation
class ParseJson{
    var data:Data!
    init(_ data:Data){
        self.data = data
    }
    func parseData() -> Events{
        print(self.data)
        var decoder = JSONDecoder()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        let events: Events = try! decoder.decode(Events.self, from: data)
        return events;
    }
    
    func pars_new_data() -> [SPBGoEvents]{
        print(self.data)
        var decoder = JSONDecoder()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        let events: [SPBGoEvents] = try! decoder.decode([SPBGoEvents].self, from: data)
        return events;
    }
     
}
