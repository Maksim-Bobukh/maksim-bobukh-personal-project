//
//  CatCollectionViewCell.swift
//  MyFinalProject
//
//  Created by Максим on 23.12.2021.
//

import UIKit

final class CatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catNameLabel: UILabel!
    
    
    func seetupCell(with cat:Cat){
        self.catImageView.image = UIImage(named: cat.imageName)
        self.catNameLabel.text = cat.name
    }
    
}
