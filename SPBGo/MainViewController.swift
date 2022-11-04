//
//  MainViewController.swift
//  SPBGo
//
//  Created by Andrey on 03.11.2022.
//

import UIKit
class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func viewDidAppear(_ animated: Bool) {
        var bottomBar = UITabBarController();
        var events = storyboard?.instantiateViewController(withIdentifier: "eventsscreen") as! EventsController;
        var map = storyboard?.instantiateViewController(withIdentifier: "mapscreen") as! MapController;
        var leadeboard = storyboard?.instantiateViewController(withIdentifier: "leaderboardscreen") as! LeaderBoardController;
        events.title = "Events";
        map.title = "Map"
        leadeboard.title = "LeaderBoard"
        bottomBar.setViewControllers([events,map,leadeboard], animated: true)
        bottomBar.modalPresentationStyle = .fullScreen
        present(bottomBar,animated: false,completion: nil)
    }
    @objc func button_click(sender: UIButton){
        print("ok")
       
    }
    

}
