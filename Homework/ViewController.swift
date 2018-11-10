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
    @IBOutlet weak var loginButton: UIButton!
    var logoutUser: LoginViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessage.text = ""
    }

    @IBAction func getLoginForm(_ sender: UIButton) {
        guard  let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            fatalError("View Controller not found")
        }
        loginVC.delegate = self
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

extension ViewController: WelcomeDelegate {
    func getStart(_ sender: String?) {
        welcomeMessage.text = "Welcome \(sender!)"
    }
}

