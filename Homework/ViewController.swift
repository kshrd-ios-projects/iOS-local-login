//
//  ViewController.swift
//  Homework
//
//  Created by Sreng Khorn on 9/11/18.
//  Copyright © 2018 Sreng Khorn. All rights reserved.
//

import UIKit

class ButtonStyle {
    var button: UIButton!
    func outline() {
        button.backgroundColor = UIColor.init(named: "#333223")
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitleColor(UIColor.white, for: .normal)
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var welcomeMessage: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    var logoutUser: LoginViewController?
    var buttonType = ButtonStyle()
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessage.text = ""
        
        buttonType.button = loginButton
        buttonType.outline()
    }

    @IBAction func getLoginForm(_ sender: UIButton) {
        let checkBtn = sender.titleLabel?.text
        if checkBtn! == "Logout" {
            welcomeMessage.text = ""
            
            buttonType.outline()
            loginButton.setTitle("Login", for: .normal)
        } else {
            guard  let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
                fatalError("View Controller not found")
            }
            loginVC.person = self.user
            loginVC.delegate = self
            navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
}

extension ViewController: WelcomeDelegate {
    func getStart(_ username: String) {
        welcomeMessage.text = "Welcome \(username)"
        loginButton.backgroundColor = UIColor.red
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.setTitle("Logout", for: .normal)
    }
}

