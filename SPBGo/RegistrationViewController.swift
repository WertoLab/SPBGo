//
//  RegistrationViewController.swift
//  SPBGo
//
//  Created by Andrey on 03.11.2022.
//

import UIKit 

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var LoginField: UITextField!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var RepeatPasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveButton.addTarget(self, action: #selector(SaveButtonAction), for:.touchUpInside)
        LoginField.placeholder = "please generate login"
        PasswordField.placeholder = "please enter new password"
        RepeatPasswordField.placeholder = "please repeat your password"
        BackButton.addTarget(self, action: #selector(BackButtonAction), for:.touchUpInside)

    }
    @objc func SaveButtonAction(sender:UIButton){
        if(PasswordField.text! != RepeatPasswordField.text!){
            print("Passwords are not coincide")
        }else{
            print(LoginField.text!)
            print(PasswordField.text!)
        }
        
    }
    @objc func BackButtonAction(sender:UIButton){
        var move_to_main = storyboard?.instantiateViewController(withIdentifier: "mainviewcontroller") as! ViewController
        move_to_main.modalPresentationStyle = .fullScreen;
        present(move_to_main, animated:true)
    }
    
}
