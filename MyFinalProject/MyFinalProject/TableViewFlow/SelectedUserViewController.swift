//
//  SelectedUserViewController.swift
//  MyFinalProject
//
//  Created by Максим on 26.11.2021.
//

import UIKit

class SelectedUserViewController:UIViewController{
    static let Identifier = "SelectedUserViewController"
    var user:User?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var iconPhotoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailsScreen(user: user!)
    }
    
    func setupDetailsScreen(user:User){
         
         nameLabel.text = user.name
         surnameLabel.text = user.surname
         ageLabel.text = String(user.age)
         heightLabel.text = String(user.hight)
         statusLabel.text = user.status
         iconPhotoImage.image = user.iconImage
         
     }
    
}
