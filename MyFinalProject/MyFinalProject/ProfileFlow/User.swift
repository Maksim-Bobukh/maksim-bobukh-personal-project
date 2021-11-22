//
//  User.swift
//  MyFinalProject
//
//  Created by Максим on 22.11.2021.
//

import UIKit

final class User{
    var name:String
    var surname:String
    var email:String
    var bio:String
    
    init(name : String, surname : String,email:String,bio:String){
        self.name = name
        self.surname = surname
        self.email = email
        self.bio = bio
    }
    init(){
        self.name = "not value"
        self.surname = "not value"
        self.email = "not value"
        self.bio = "not value"
    }
}
