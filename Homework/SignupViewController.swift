//
//  SignupViewController.swift
//  Homework
//
//  Created by Sreng Khorn on 10/11/18.
//  Copyright © 2018 Sreng Khorn. All rights reserved.
//

import UIKit

protocol SignupDelegate: AnyObject {
    func registerNewUser(_ sender: User)
}

class SignupViewController: UIViewController {
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var usernameMessage: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordMessage: UILabel!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordMessage: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    
    weak var delegate: SignupDelegate?
    var buttonType = ButtonStyle()
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = ""
        usernameMessage.text = ""
        passwordMessage.text = ""
        confirmPasswordMessage.text = ""
        signupButton.isEnabled = false
        buttonType.button = signupButton
        buttonType.outline()
        signupButton.alpha = 0.5
        
        usernameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @IBAction func addNewUser(_ sender: Any) {
        
        if usernameField.text?.isEmpty ?? true || passwordField.text?.isEmpty ?? true || confirmPasswordField.text?.isEmpty ?? true {
            signupButton.alpha = 0.4
            signupButton.isEnabled = false
            
        } else if user.allUsers.contains(where: { $0.username == usernameField.text! }) {
            message.text = "username is already exist. try new one!"
            
        } else {
            user.username = usernameField.text!
            user.password = passwordField.text!
            user.allUsers.append(user)
            delegate?.registerNewUser(user)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func textFieldDidChange(_ sender: UITextField) {
        if usernameField.text?.isEmpty ?? true || passwordField.text?.isEmpty ?? true || confirmPasswordField.text?.isEmpty ?? true {
            signupButton.alpha = 0.4
        }
    }
    
    @IBAction func usernameChanged(_ sender: UITextField) {
        let num = usernameField.text?.count
        if num! < 5 {
            usernameMessage.text = "* minimum is at least 5 characters"
            signupButton.alpha = 0.4
            signupButton.isEnabled = false
        } else {
            signupButton.alpha = 1.0
            usernameMessage.text = ""
            signupButton.isEnabled = true
        }
    }
    
    @IBAction func passwdChange(_ sender: UITextField) {
        let num = passwordField.text?.count
        if num! < 5 {
            passwordMessage.text = "* minimum is at least 5 characters"
            signupButton.alpha = 0.4
            signupButton.isEnabled = false
        } else {
            signupButton.alpha = 1.0
            passwordMessage.text = ""
            signupButton.isEnabled = true
        }
    }
    
    @IBAction func confirmEnd(_ sender: Any) {
        if passwordField.text?.isEmpty ?? true && confirmPasswordField.text?.isEmpty ?? true {
            confirmPasswordMessage.text = ""
        }
    }
}


extension SignupViewController {
    @IBAction func confirmEditingChanged(_ sender: Any) {
        if passwordField.text != confirmPasswordField.text {
            confirmPasswordMessage.text = "confirm password doesn't match!"
            signupButton.isEnabled = false
            signupButton.alpha = 0.4
        } else {
            confirmPasswordMessage.text = ""
            signupButton.alpha = 1.0
            signupButton.isEnabled = true
        }
    }
}
