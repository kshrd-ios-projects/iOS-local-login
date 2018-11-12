//
//  LoginViewController.swift
//  Homework
//
//  Created by Sreng Khorn on 10/11/18.
//  Copyright © 2018 Sreng Khorn. All rights reserved.
//

import UIKit

protocol WelcomeDelegate: AnyObject {
    func getStart(_ sender: User, username: String)
}

class LoginViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    var person = User()
    weak var delegate: WelcomeDelegate?
    var buttonType = ButtonStyle()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
        
        buttonType.button = loginButton
        buttonType.outline()
        
        buttonType.button = signupButton
        buttonType.outline()
    }
    
    @IBAction func doLogin(_ sender: Any) {
        
        if person.isExist(name: usernameField.text!, passwd: passwordField.text!) {
            delegate?.getStart(person, username: usernameField.text!)
            self.navigationController?.popViewController(animated: true)
        } else if usernameField.text?.isEmpty ?? true || passwordField.text?.isEmpty ?? true {
            messageLabel.text = "username or password is empty"
        }
        else {
            messageLabel.numberOfLines = 2
            messageLabel.text = "username or password might be wrong!"
        }
    }
    
    
    @IBAction func getSignupForm(_ sender: Any) {
        guard  let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController else {
            fatalError("View Controller not found")
        }
        signupVC.user = self.person
        signupVC.delegate = self
        navigationController?.pushViewController(signupVC, animated: true)
    }

}


extension LoginViewController: SignupDelegate {
    func registerNewUser(_ sender: User) {
        person.allUsers.append(sender)
    }
}
