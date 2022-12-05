 //
//  ViewController.swift
//  SPBGo
//
//  Created by Andrey on 02.11.2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var LoginText: UITextField!
    @IBOutlet weak var messageLabelSecond: UILabel!
    @IBOutlet weak var messageLabelFirst: UILabel!
    
    private var regex = "abcdefghijklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXZ0123456789"
    private let minLength = 5
    private let minLogLength = 3
    private var isPasswordCorrect:Bool = false;
    private var isLoginCorrect:Bool = false;
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var savedChargeData: String? = UserDefaults.standard.object(forKey: "Token") as? String
               if(savedChargeData != nil){
                   print("token_")
                   let move_to_main_screen = storyboard?.instantiateViewController(withIdentifier: "mainscreen") as! MainViewController;
                   move_to_main_screen.modalPresentationStyle = .fullScreen;
                   present(move_to_main_screen, animated:true)
               }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
               
        LoginText.placeholder = "Please enter your login";
        LoginText.layer.cornerRadius = 10.0;
        LoginText.layer.borderWidth = 2.0;
        PasswordText.placeholder = "Please enter your password";
        PasswordText.layer.borderWidth = 2.0;
        PasswordText.layer.cornerRadius = 10.0;
        messageLabelFirst.text = ""
        LoginText.addTarget(self, action: #selector(textLoginChanged(_:)),for: .editingChanged)
        PasswordText.addTarget(self, action: #selector(textPasswordChanged(_:)),for: .editingChanged)
       
        messageLabelFirst.backgroundColor = .white
        messageLabelSecond.backgroundColor = .white
        
        SignInButton.addTarget(self, action: #selector(SignInButtonAction), for:.touchUpInside)
        SignInButton.tintColor = .gray
        LogInButton.addTarget(self, action: #selector(LogInButtonAction), for:.touchUpInside)

    }
    @objc func LogInButtonAction(sender: UIButton){
        
        var login:String = LoginText.text!;
        var password:String = PasswordText.text!;
        print(password_matches(regex, password))
        print(login)
        print(password)
         var move_to_main_screen = storyboard?.instantiateViewController(withIdentifier: "mainscreen") as! MainViewController;
         move_to_main_screen.modalPresentationStyle = .fullScreen;
         present(move_to_main_screen, animated:true)
         get_token(login, password)
         
        
    }
    @objc func SignInButtonAction(sender: UIButton) {
        var move_to_registration = storyboard?.instantiateViewController(withIdentifier: "Registration") as! RegistrationViewController
        move_to_registration.modalPresentationStyle = .fullScreen;
        present(move_to_registration, animated:true)
        
        
    }
    
    func checkPasswordValidation(password: String) {
        if password_matches(regex, password) == true {
            isPasswordCorrect = true
            messageLabelSecond.text = ""
        } else {
            isPasswordCorrect = false
            messageLabelSecond.text = "Пароль должен содержать 5-20 символов,\nлатинские буквы и цифры"
            messageLabelSecond.textColor = .red
        }
        
    }
    func checkLoginValidation(login: String) {
        if login_mathes(regex, login) == true {
            isLoginCorrect = true
            messageLabelFirst.text = ""
        } else {
            isLoginCorrect = false
            messageLabelFirst.text = "Логин должен содержать 3-20 символов,\nлатинские буквы и цифры"
            messageLabelFirst.textColor = .red
        }
        
    }
    
    func password_matches(_ regex: String, _ password: String) -> Bool {
        if Array(password).count < 5 || Array(password).count > 20 {
            return false
        }
        var password: String = password
        var chars = Array(password)
        var allowed_chars = Array(regex)
        var is_allowed: Bool = true
        var amount: Int = 0
        for i in 0...chars.count-1 {
            print(chars[i])
            for j in 0...allowed_chars.count-1 {
                if chars[i] == allowed_chars[j] {
                    amount += 1
                }
            }
            if amount == 0 {
                return false
            }
            amount = 0
        }
        return is_allowed
    }
    
    func login_mathes(_ regex: String, _ login: String) -> Bool {
        if Array(login).count < 3 || Array(login).count > 20 {
            return false
        }
        var login: String = login
        var log_chars = Array(login)
        var allowed_log_chars = Array(regex)
        var are_allowed: Bool = true
        var quantity: Int = 0
        for i in 0...log_chars.count-1 {
            for j in 0...allowed_log_chars.count-1 {
                if log_chars[i] == allowed_log_chars[j] {
                    quantity += 1
                }
            }
            if quantity == 0 {
                return false
            }
            quantity = 0
        }
        return are_allowed
    }
    
    func checkFields(_ isLoginCorrect:Bool,_ isPasswordCorrect:Bool) {
        if  (isLoginCorrect == true && isPasswordCorrect == true) {
            LogInButton.isEnabled = true
        } else {
            LogInButton.isEnabled = false
        }
    }
    func get_token(_ login:String,_ password:String){
            let json: [String: Any] = ["login": login,"password":password]

                    let jsonData = try? JSONSerialization.data(withJSONObject: json)

                    // create post request
                    let url = URL(string: "http://77.234.215.138:60866/spbgo/api/signin")! //PUT Your URL
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    // insert json data to the request
                    request.httpBody = jsonData

                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        guard let data = data, error == nil else {
                            print(error?.localizedDescription ?? "No data")
                            print("really")
                            return
                        }
                        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                        if let responseJSON = responseJSON as? [String: Any] {
                            //print(responseJSON)
                            //print(responseJSON["access_token"]!)
                            UserDefaults.standard.set(responseJSON["access_token"]!, forKey: "Token") //setObject
                            var savedChargeData: String? = UserDefaults.standard.object(forKey: "Token") as? String
                            print(savedChargeData!)
                            //Code after Successfull POST Request
                        }
                        
                    }

                    task.resume()
        }
}
