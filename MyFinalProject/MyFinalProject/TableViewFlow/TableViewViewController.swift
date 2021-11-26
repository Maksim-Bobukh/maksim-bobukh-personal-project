//
//  TableViewViewController.swift
//  MyFinalProject
//
//  Created by Максим on 22.11.2021.
//

import UIKit

class TableViewViewController:UIViewController{
    @IBOutlet weak var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pushAuthVc(){
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "AuthViewController") as! AuthViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func authButtonClicked(_ sender: Any) {
        pushAuthVc()
    }
    
    
}
