//
//  ProcessingData.swift
//  SPBGo
//
//  Created by Andrey on 07.11.2022.
//

import Foundation
class ProcessingData : ProcessingInterface{
    var events:Events!
    func GetEvents(_ pageSize: Int, _ pageNumber: Int) -> Events {
        var events:Events!;
        return events
    }
    
    func GetEventInfo(_ event_id: Int) -> Event {
        for i in 0...events.count-1 {
            if(self.events.results[i].id == event_id){
                return self.events.results[i]
            }
        
        }
        return Event(-1,"nil","nil");
    }
    
    init(_ events:Events){
        self.events = events
    }
   
}
