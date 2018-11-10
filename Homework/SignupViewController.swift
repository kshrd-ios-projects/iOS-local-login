//
//  SignupViewController.swift
//  Homework
//
//  Created by Sreng Khorn on 10/11/18.
//  Copyright © 2018 Sreng Khorn. All rights reserved.
//

import UIKit

protocol SignupDelegate: AnyObject {
    func registerNewUser(_ sender: [String: String])
}

class SignupViewController: UIViewController {
    weak var delegate: SignupDelegate?
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordMessage: UILabel!
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmPasswordMessage.text = ""
    }

    @IBAction func addNewUser(_ sender: Any) {
        delegate?.registerNewUser(["username": usernameField.text!, "password": passwordField.text!])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmEnd(_ sender: Any) {
        if passwordField.text?.isEmpty ?? true || confirmPasswordField.text?.isEmpty ?? true {
            confirmPasswordMessage.text = ""
        }
    }
}


extension SignupViewController {
    @IBAction func confirmEditingChanged(_ sender: Any) {
        if passwordField.text != confirmPasswordField.text {
            confirmPasswordMessage.text = "confirm password doesn't match!"
            signupButton.isEnabled = false
        } else {
            confirmPasswordMessage.text = ""
            signupButton.isEnabled = true
        }
    }
}
