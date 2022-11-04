 //
//  ViewController.swift
//  SPBGo
//
//  Created by Andrey on 02.11.2022.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var LogInButton: UIButton!
        
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var LoginText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginText.placeholder = "Please enter your login";
        LoginText.layer.cornerRadius = 10.0;
        LoginText.layer.borderWidth = 2.0;
        PasswordText.placeholder = "Please enter your password";
        PasswordText.layer.borderWidth = 2.0;
        PasswordText.layer.cornerRadius = 10.0;
         SignInButton.addTarget(self, action: #selector(SignInButtonAction), for:.touchUpInside)
        LogInButton.addTarget(self, action: #selector(LogInButtonAction), for:.touchUpInside)

        
        
    }
    @objc func LogInButtonAction(sender: UIButton){
        var login:String = LoginText.text!;
        var password:String = PasswordText.text!;
        print(login)
        print(password)
        var move_to_main_screen = storyboard?.instantiateViewController(withIdentifier: "mainscreen") as! MainViewController;
        move_to_main_screen.modalPresentationStyle = .fullScreen;
        present(move_to_main_screen, animated:true)
    }
    @objc func SignInButtonAction(sender: UIButton) {
        var move_to_registration = storyboard?.instantiateViewController(withIdentifier: "Registration") as! RegistrationViewController
        move_to_registration.modalPresentationStyle = .fullScreen;
        present(move_to_registration, animated:true)
     }
}

