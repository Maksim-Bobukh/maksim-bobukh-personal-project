//
//  TableViewCell.swift
//  MyFinalProject
//
//  Created by Максим on 26.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let reuseIdentifier = "TableViewCell"
    
    @IBOutlet weak var iconPhotoimage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    private var user: User?
    
    func setup(user: User){
        self.user = user
        nameLabel.text = user.name
        surnameLabel.text = user.surname
        iconPhotoimage.image = user.iconImage
    }
    
}
