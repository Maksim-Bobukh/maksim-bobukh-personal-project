//
//  TableViewCell.swift
//  MyFinalProject
//
//  Created by Максим on 26.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let reuseIdentifier = "TableViewCell"
    
    @IBOutlet private weak var iconPhotoimage: UIImageView!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var photo: PhotoDescription! {
        didSet{
            self.idLabel.text = String(self.photo.id)
            self.titleLabel.text = self.photo.title
            self.iconPhotoimage.setImage(imageURL: self.photo.url)
        }
    }
    
}
