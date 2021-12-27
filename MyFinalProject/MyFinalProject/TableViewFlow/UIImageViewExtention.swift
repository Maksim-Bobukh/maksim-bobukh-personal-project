//
//  UIImageViewExtention.swift
//  MyFinalProject
//
//  Created by Максим on 27.12.2021.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(imageURL: String){
        self.kf.setImage(with: URL(string: imageURL))
    }
    
}
