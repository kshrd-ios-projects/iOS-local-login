//
//  UserModel.swift
//  Homework
//
//  Created by Sreng Khorn on 12/11/18.
//  Copyright © 2018 Sreng Khorn. All rights reserved.
//

import Foundation

class User {
    var username: String
    var password: String
    var allUsers = [User]()
    var numberOfUsers: Int {
        return allUsers.count
    }
    
    init(){
        username = ""
        password = ""
    }
    
    subscript(i: Int) -> User {
        get {
            return allUsers[i]
        }
        set {
            allUsers[i] = newValue
        }
    }
    
    func isExist(name: String, passwd: String) -> Bool {
        if allUsers.contains(where: { $0.username == name }) && allUsers.contains(where: { $0.password == passwd }) {
            return true
        } else {
            return false
        }
    }
    
    func getNumberOfUsers() -> Int {
        return numberOfUsers
    }
    
}
