//
//  EventsController.swift
//  SPBGo
//
//  Created by Andrey on 03.11.2022.
//

import UIKit
import Kingfisher
class EventsController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var urlString:String! =  "https://upload.wikimedia.org/wikipedia/commons/4/49/A_black_image.jpg"//"https://upload.wikimedia.org/wikipedia/commons/4/49/A_black_image.jpg"
    var events:Events! = Events(1,[Event(0,"0","0")])
    var SPBGo_Events:[SPBGoEvents]!
    @IBOutlet weak var tableView: UITableView!
    var img:UIImageView! = nil
    
    var url = URL(string: "https://kudago.com/public-api/v1.4/events/?lang=&fields=&expand=&order_by=&text_format=&ids=&location=spb&actual_since=1667663325&actual_until=1667663325&is_free=true&categories=&lon=&lat=&radius=")!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.dataSource = self;
        tableView.delegate = self;
        //tableView.separatorStyle = .singleLine
       
        /*
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
          guard let data = data else { return }
          let parseJson = ParseJson(data)
          let parsed_data = parseJson.parseData()
          self.events = parsed_data
          //print(self.events.results[0].title)
          DispatchQueue.main.async {
              self.tableView.reloadData()
          }
        }
        task.resume()
        */
        
        let string = "http://77.234.215.138:60866/spbgo/api/events?limit=20&offset=0"
            let url = NSURL(string: string)
            let request = NSMutableURLRequest(url: url! as URL)
            request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMSJ9.3W0axDqaGRBhY59zqlAUZv36et7K6O_bFoneEND2c0k", forHTTPHeaderField: "Access-Token")
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let session = URLSession.shared

            let mData = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
                if let res = response as? HTTPURLResponse {
                    guard let data = data else { return }
                    print(data)
                    let parseJson = ParseJson(data)
                    let parsed_data = parseJson.pars_new_data()
                    self.SPBGo_Events = parsed_data
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    print(parsed_data[0].event.place)
                    print("Fetched")
                }else{
                    print("Error: \(String(describing: error))")
                }
            }
            mData.resume()
        //downloadImage(with: "https://upload.wikimedia.org/wikipedia/commons/4/49/A_black_image.jpg",)
        /*
        var process = ProcessingInterface()
        process.GetEvents(1, 2)
         
        var process = ProcessingData()
        process.GetEvents(1, 1,events)
        if(events.results.count != 1){
            print("ok1")
            tableView.reloadData()
        }
         */
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.SPBGo_Events != nil){
            return self.SPBGo_Events.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var event = self.SPBGo_Events[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "custom_cell", for: indexPath) as! TableCustomCell
        cell.title.text = "e"
        //cell.img = nil
        cell.img.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        cell.img.contentMode = .scaleAspectFill
        cell.img.layer.cornerRadius = 14.0
        cell.img.clipsToBounds = true
        cell.price.text = event.event.title
        cell.date.text = "P"
        self.img = cell.img
        cell.img.kf.setImage(with: URL(string: event.event.image), placeholder: nil, options: nil, progressBlock: nil, completionHandler: { result in
        switch result {
            case .success(let value):
                        print("Image: \(value.image). Got from: \(value.cacheType)")
                        //print("ok")
            case .failure(let error):
                        //print("ok")
                        print("Error: \(error)")
            }
        })
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
    
