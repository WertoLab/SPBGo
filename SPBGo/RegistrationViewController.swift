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
    @IBOutlet weak var messageLabelFirst: UILabel!
    @IBOutlet weak var messageLabelSecond: UILabel!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var messageLabelThird: UILabel!
    
    private var regex = "abcdefghijklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXZ0123456789"
    private var name_regex = "abcdefghijklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXZ0123456789абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
    private let minLength = 5
    private let minLogLength = 3
    private var isPasswordCorrect:Bool = false;
    private var isLoginCorrect:Bool = false;
    private var isNameCorrect:Bool = false;
    private var arePasswordsSame:Bool = false;
    private var isCoincideCorrect:Bool = false;
    private var firstPassword:String! = nil;
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        //print(savedChargeData)
        
        SaveButton.isEnabled = false
        SaveButton.addTarget(self, action: #selector(SaveButtonAction), for:.touchUpInside)
        NameField.placeholder = "please enter your name"
        LoginField.placeholder = "please generate login"
        PasswordField.placeholder = "please enter new password"
        RepeatPasswordField.placeholder = "please repeat your password"
        BackButton.addTarget(self, action: #selector(BackButtonAction), for:.touchUpInside)
        LoginField.addTarget(self, action: #selector(textLoginChanged(_:)),for: .editingChanged)
        PasswordField.addTarget(self, action: #selector(textPasswordChanged(_:)),for: .editingChanged)
        NameField.addTarget(self, action: #selector(textNameChanged(_:)), for: .editingChanged)
        RepeatPasswordField.addTarget(self, action: #selector(textSecondPasswordChanged(_:)), for: .editingChanged)
        messageLabelFirst.backgroundColor = .white
        messageLabelSecond.backgroundColor = .white
        messageLabelThird.backgroundColor = .white
        
        messageLabelFirst.numberOfLines = 2
        messageLabelSecond.numberOfLines = 2
        messageLabelThird.numberOfLines = 2
    }
    @objc func textLoginChanged(_ new_text:UITextField){
        checkLoginValidation(login: new_text.text!)
        checkFields(isLoginCorrect, isPasswordCorrect, isNameCorrect,isCoincideCorrect)
    }
    @objc func textPasswordChanged(_ new_text:UITextField){
        checkPasswordValidation(password: new_text.text!)
        checkFields(isLoginCorrect, isPasswordCorrect, isNameCorrect,isCoincideCorrect)
    }
    @objc func textNameChanged(_ new_text:UITextField) {
        checkNameValidation(name: new_text.text!)
        checkFields(isLoginCorrect, isPasswordCorrect, isNameCorrect,isCoincideCorrect)
    }
    @objc func textSecondPasswordChanged(_ new_text:UITextField){
        checkCoincideValidation(passwordRepeat: new_text.text!)
        checkFields(isLoginCorrect, isPasswordCorrect, isNameCorrect,isCoincideCorrect)
    }
    
    @objc func SaveButtonAction(sender:UIButton){
        /*
        if(PasswordField.text! == RepeatPasswordField.text!){
            arePasswordsSame = true
        } else {
            postData(NameField.text!,LoginField.text!, PasswordField.text!)
            arePasswordsSame = false
        }
         */
        postData(NameField.text!,LoginField.text!, PasswordField.text!)
        //print("ok")
        
    }
     
    /*
     8
     8
     8
     8
     8
     8
     8
     8
     */
    func postData(_ name:String,_ login:String, _  password:String){
        print(name)
        print(login)
        print(password)
        let json: [String: Any] = ["name": name,"login":login,"password":password]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        // create post request
        let url = URL(string: "http://77.234.215.138:60866/spbgo/api/signup")! //PUT Your URL
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
            if (responseJSON == nil){
                print("got data")
                //print(login)
                //self.get_token(login,password)
            }
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
                //Code after Successfull POST Request
            }
            
        }

        task.resume()
        }
    /*func get_token(_ login:String,_ password:String){
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
    }*/
    
    @objc func BackButtonAction(sender:UIButton){
        var move_to_main = storyboard?.instantiateViewController(withIdentifier: "mainviewcontroller") as! ViewController
        move_to_main.modalPresentationStyle = .fullScreen;
        present(move_to_main, animated:true)
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
    func name_mathes(_ name_regex: String, _ name: String) -> Bool {
        if Array(name).count < 2 || Array(name).count > 30 {
            return false
        }
        var name: String = name
        var name_chars = Array(name)
        var allowed_name_chars = Array(name_regex)
        var are_allowed: Bool = true
        var quantity: Int = 0
        for i in 0...name_chars.count-1 {
            for j in 0...allowed_name_chars.count-1 {
                if name_chars[i] == allowed_name_chars[j] {
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
    func checkLoginValidation(login: String) {
        if login_mathes(regex, login) == true {
            isLoginCorrect = true
            messageLabelFirst.text = ""
        } else {
            isLoginCorrect = false
            messageLabelFirst.text = "Логин должен содержать 5-20 символов, латинские буквы и цифры"
            messageLabelFirst.textColor = .red
        }
    }
    func checkPasswordValidation(password: String) {
        if password_matches(regex, password) == true {
            isPasswordCorrect = true
            messageLabelSecond.text = ""
            self.firstPassword = password
        } else {
            isPasswordCorrect = false
            messageLabelSecond.text = "Пароль должен содержать 5-20 символов, латинские буквы и цифры"
            messageLabelSecond.textColor = .red
        }
    }
    func checkCoincideValidation(passwordRepeat: String) {
        print(firstPassword!)
        if password_matches(regex, passwordRepeat) == true {
            if(passwordRepeat == firstPassword){
                isCoincideCorrect = true
                messageLabelSecond.text = ""
            }else{
                messageLabelSecond.text = "Символы не совпадают"
                messageLabelSecond.textColor = .red
            }
        } else {
            isCoincideCorrect = false
            messageLabelSecond.text = "Пароль должен содержать 5-20 символов, латинские буквы и цифры"
            messageLabelSecond.textColor = .red
        }
    }
    func checkNameValidation(name: String) {
        if name_mathes(name_regex, name) == true {
            isNameCorrect = true
            messageLabelThird.text = ""
        } else {
            isNameCorrect = false
            messageLabelThird.text = "Имя должно содержать 2-30 символов, латинские или русские буквы"
            messageLabelThird.textColor = .red
            
        }
    }
    /*
    func arePasswordFine(_ PasswordField: String, _ RepeatPasswordField: String) {
        if PasswordField == RepeatPasswordField {
            arePasswordsSame = true
        } else {
            arePasswordsSame = false
        }
    }
     */
    func checkFields(_ isLoginCorrect:Bool,_ isPasswordCorrect:Bool, _ isNameCorrect: Bool,_ isCoincidePasswordCorrect:Bool) {
        if  (isLoginCorrect == true && isPasswordCorrect == true && isNameCorrect == true && isCoincidePasswordCorrect == true) {
            SaveButton.isEnabled = true
        } else {
            SaveButton.isEnabled = false
        }
    }
}

