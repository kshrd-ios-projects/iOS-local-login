//
//  ViewController.swift
//  Homework
//
//  Created by Sreng Khorn on 9/11/18.
//  Copyright © 2018 Sreng Khorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var welcomeMessage: UILabel!
    var tempUser: [String: String] = ["username": "", "password": ""]
    @IBOutlet weak var loginButton: UIButton!
    var logoutUser: LoginViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessage.text = ""
        loginButtonStyle()
    }

    @IBAction func getLoginForm(_ sender: UIButton) {
        let checkBtn = sender.titleLabel?.text
        if checkBtn! == "Logout" {
            welcomeMessage.text = ""
            
            loginButtonStyle()
            loginButton.setTitle("Login", for: .normal)
        } else {
            guard  let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
                fatalError("View Controller not found")
            }
            loginVC.tempUser = self.tempUser
            loginVC.delegate = self
            navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
    func loginButtonStyle() {
        loginButton.backgroundColor = UIColor.init(named: "#333223")
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.setTitleColor(UIColor.white, for: .normal)
    }
    
}

extension ViewController: WelcomeDelegate {
    func getStart(_ sender: [String: String]) {
        tempUser["username"] = sender["username"]
        tempUser["password"] = sender["password"]
        welcomeMessage.text = "Welcome \(sender["username"]!)"

        loginButton.backgroundColor = UIColor.red
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.setTitle("Logout", for: .normal)
    }
}

