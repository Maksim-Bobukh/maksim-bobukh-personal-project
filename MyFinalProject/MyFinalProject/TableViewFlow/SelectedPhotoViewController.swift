//
//  SelectedUserViewController.swift
//  MyFinalProject
//
//  Created by Максим on 26.11.2021.
//

import UIKit

class SelectedPhotoViewController:UIViewController {
    static let Identifier = "SelectedPhotoViewController"
    
    var photo: PhotoDescription!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumIdLabel: UILabel!
   
    @IBOutlet weak var iconPhotoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailsScreen(photo: photo!)
    }
    
    func setupDetailsScreen(photo:PhotoDescription){
         
        self.idLabel.text = String(self.photo!.id)
        self.titleLabel.text = self.photo?.title
        self.iconPhotoImage.setImage(imageURL: self.photo!.url)
        self.albumIdLabel.text = String(self.photo!.albumId)
         
     }
}
