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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addNewUser(_ sender: Any) {
        delegate?.registerNewUser(["username": usernameField.text!, "password": passwordField.text!])
        self.navigationController?.popViewController(animated: true)
    }
}
