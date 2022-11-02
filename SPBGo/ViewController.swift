//
//  ViewController.swift
//  SPBGo
//
//  Created by Andrey on 02.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SignInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
         SignInButton.addTarget(self, action: #selector(buttonAction), for:.touchUpInside)
        // Do any additional setup after loading the view.
        
    }
    @objc func buttonAction(sender: UIButton) {
        print("Button tapped")
     }
    


}

