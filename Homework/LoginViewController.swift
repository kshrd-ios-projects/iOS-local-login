//
//  LoginViewController.swift
//  Homework
//
//  Created by Sreng Khorn on 10/11/18.
//  Copyright © 2018 Sreng Khorn. All rights reserved.
//

import UIKit

protocol WelcomeDelegate: AnyObject {
    func getStart(_ sender: String?)
}

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var tempUser: [String: String] = ["username": "", "password": ""]
    weak var delegate: WelcomeDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doLogin(_ sender: Any) {
        if usernameField.text == tempUser["username"] && passwordField.text == tempUser["password"] {
            delegate?.getStart(tempUser["username"])
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Username or Password might be wrong!!")
        }
    }
    
    
    @IBAction func getSignupForm(_ sender: Any) {
        guard  let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController else {
            fatalError("View Controller not found")
        }
        signupVC.delegate = self
        navigationController?.pushViewController(signupVC, animated: true)
    }

}


extension LoginViewController: SignupDelegate {
    func registerNewUser(_ sender: [String: String]) {
        tempUser["username"] = sender["username"]
        tempUser["password"] = sender["password"]
    }
}
