//
//  User.swift
//  MyFinalProject
//
//  Created by Максим on 26.11.2021.
//

import UIKit

final class User{
    let name:String
    let surname:String
    let iconImage:UIImage
    let age: Int
    let hight: Float
    let status:String
    
    init(name : String, surname : String,iconImage: UIImage,age:Int,hight: Float,status:String){
        self.name = name
        self.surname = surname
        self.iconImage = iconImage
        self.age = age
        self.hight = hight
        self.status = status
    }
}
