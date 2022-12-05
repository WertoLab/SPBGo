//
//  EventsController.swift
//  SPBGo
//
//  Created by Andrey on 03.11.2022.
//

import UIKit

class EventsController: UIViewController//,UITableViewDataSource
{
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
     */
    
    var events:Events!
    var url = URL(string: "https://kudago.com/public-api/v1.4/events/?lang=&fields=&expand=&order_by=&text_format=&ids=&location=spb&actual_since=1667663325&actual_until=1667663325&is_free=true&categories=&lon=&lat=&radius=")!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
          guard let data = data else { return }
          let parseJson = ParseJson(data)
          let parsed_data = parseJson.parseData()
          self.events = parsed_data
            print(self.events.results[0].title)
            
        }
        task.resume()
       // print(self.events.count)
         
        

        
        
        
    }
   
}
    
