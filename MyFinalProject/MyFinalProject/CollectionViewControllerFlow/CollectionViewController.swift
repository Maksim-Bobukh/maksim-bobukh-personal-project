//
//  CollectionViewController.swift
//  MyFinalProject
//
//  Created by Максим on 22.11.2021.
//

import UIKit

class CollectionViewController:UICollectionViewController{
    
    private let reuseIdentifier = "CatCell"
    
    private let itemsInRow = 5
    
    private let minSpacing = 16
    
    private var selectedIndexPath:IndexPath? = nil
    
    private let sectionInsets = UIEdgeInsets(
        top: 24.0,
        left: 16.0,
        bottom: 24.0,
        right: 16.0)
    
    private let cats = [
        Cat(name: "Yerevan", imageName: "0c375608c71811e1b10e123138105d6b_7"),
        Cat(name: "Canberra", imageName: "1d3ccf7291c211e18cf91231380fd29b_7"),
        Cat(name: "Vienna", imageName: "2f49bd8cbf0911e180d51231380fcd7e_7"),
        Cat(name: "Baku", imageName: "3ba670686e7111e181bd12313817987b_7"),
        Cat(name: "Nassau", imageName: "3f65914ca43711e1abb01231382049c1_7"),
        Cat(name: "Dhaka", imageName: "4ebcfed0a75911e1b2fe1231380205bf_7"),
        Cat(name: "Brussels", imageName: "5c7ac9ec6fa211e1a87612313804ec91_7"),
        Cat(name: "Belmopan", imageName: "6c8b25eea03911e192e91231381b3d7a_7"),
        Cat(name: "Porto-Novo", imageName: "6cd3d502c03011e180c9123138016265_7"),
        Cat(name: "Gaborone", imageName: "7d7f0184a43711e1b10e123138105d6b_7"),
        Cat(name: "Brasilia", imageName: "8a7a7bc2d76b11e195351231381b651f_7"),
        Cat(name: "Sofia", imageName: "8f496896661b11e180d51231380fcd7e_7"),
        Cat(name: "Copenhagen", imageName: "9b43befc33ea11e19e4a12313813ffc0_7"),
        Cat(name: "San Salvador", imageName: "10b80642c7da11e19894123138140d8c_7"),
        Cat(name: "Tallinn", imageName: "12a8d742be7f11e188131231381b5c25_7"),
        Cat(name: "Berlin", imageName: "16cb636ed3c711e1b62722000a1e8b36_7"),
        Cat(name: "Tbilisi", imageName: "29e2f6eaa03911e19e4a12313813ffc0_7"),
        Cat(name: "Jakarta", imageName: "33eb19201ed811e1abb01231381b65e3_7"),
        Cat(name: "Bangkok", imageName: "42fe6a682c5011e19e4a12313813ffc0_7"),
        Cat(name: "Abu Dhabi", imageName: "55d268706e7111e1989612313815112c_7")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

//MARK:CollectionViewDataSource

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CatCollectionViewCell
        let currentCat = cats[indexPath.row]
        cell.seetupCell(with: currentCat)
        
        return cell
    }
}

//MARK:CollectionViewDelegate


extension CollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.collectionView.cellForItem(at: indexPath ) as? CatCollectionViewCell
        cell?.backgroundColor = indexPath == self.selectedIndexPath ? UIColor.white : UIColor.red
        self.selectedIndexPath = indexPath
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddings = sectionInsets.right * CGFloat(itemsInRow)
        let freeSpace = self.view.frame.height - paddings
        let spaceForItem = freeSpace / CGFloat(itemsInRow)
        let size = CGSize(width: spaceForItem, height: spaceForItem)

        return size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(minSpacing)
    }

}
