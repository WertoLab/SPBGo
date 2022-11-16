//
//  EventsController.swift
//  SPBGo
//
//  Created by Andrey on 03.11.2022.
//

import UIKit

class EventsController: UIViewController,UITableViewDataSource{
    
    var events:Events! //= Events(2,[Event(1,"Event1","4"),Event(1,"Event2","6")])
    @IBOutlet weak var tableView: UITableView!
    func onEventsReady(_ events: Events) {
        self.events = events
    }
    var url = URL(string: "https://kudago.com/public-api/v1.4/events/?lang=&fields=&expand=&order_by=&text_format=&ids=&location=spb&actual_since=1667663325&actual_until=1667663325&is_free=true&categories=&lon=&lat=&radius=")!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.dataSource = self;
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
          guard let data = data else { return }
          let parseJson = ParseJson(data)
          let parsed_data = parseJson.parseData()
          self.onEventsReady(parsed_data)
            print(self.events.results[0].title)
            
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.events != nil){
            print(self.events.count)
            return self.events.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var event = events.results[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "custom_cell", for: indexPath) as! TableCustomCell
        cell.title.text = event.title
        cell.img = nil
        cell.price.text = event.slug
        return cell
    }
     
   
}
    
