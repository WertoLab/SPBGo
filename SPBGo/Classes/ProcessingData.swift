//
//  ProcessingData.swift
//  SPBGo
//
//  Created by Andrey on 07.11.2022.
//

import Foundation
import UIKit
class ProcessingData{//: ProcessingInterface{
    var events:Events!
     
    func GetEvents(_ pageSize: Int, _ pageNumber: Int,_ events: Events!){
        print("ok")
        var url = URL(string: "https://kudago.com/public-api/v1.4/events/?lang=&fields=&expand=&order_by=&text_format=&ids=&location=spb&actual_since=1667663325&actual_until=1667663325&is_free=true&categories=&lon=&lat=&radius=")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
          guard let data = data else { return }
          let parseJson = ParseJson(data)
          let parsed_data = parseJson.parseData()
           
          //print(events.results[2].title)
          DispatchQueue.main.async {
              events.results.append(parsed_data.results[0])
              events.results.append(parsed_data.results[1])
              print(events.results.count)
             //tableView.reloadData()
            //tableView.reloadData()
          }
        }
        task.resume()
    }
    
    func GetEventInfo(_ event_id: Int) -> Event {
        for i in 0...events.count-1 {
            if(self.events.results[i].id == event_id){
                return self.events.results[i]
            }
        
        }
        return Event(-1,"nil","nil");
    }
     init(){}
   
}
