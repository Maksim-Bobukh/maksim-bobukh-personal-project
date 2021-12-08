//
//  TableViewViewController.swift
//  MyFinalProject
//
//  Created by Максим on 22.11.2021.
//

import UIKit

class TableViewViewController:UIViewController{
    @IBOutlet weak var authButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private var users = createUsers()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    @objc private func refreshUsers(_ sender: UIRefreshControl){
        users.shuffle()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {[weak self] in
            sender.endRefreshing()
            self?.tableView.reloadData()
        }
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
    
extension TableViewViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userInf = users[indexPath.row]
        
        pushUserVC(user: userInf)
    }
    func pushUserVC(user:User){
        //let userInf = users[indexPath.row]
        let storyboard = UIStoryboard(name: "SelectedUser", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "SelectedUserViewController") as! SelectedUserViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        viewController.setupDetailsScreen(user: user)
        //viewController.setupDetailsScreen(user:userInf)
    }
}

extension TableViewViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier) as! TableViewCell
        let user = users[indexPath.row]
        cell.setup(user: user)
        return cell
    }
}

private extension TableViewViewController{
    
    static func createUsers() -> [User]{
        return[
            User(name: "Adam", surname: "Smith", iconImage:UIImage(named: "man")!,age: 25,hight: 185,status: "status: along"),
            User(name: "Pawel", surname: "Groove", iconImage: UIImage(named: "man")!,age: 27,hight: 175,status: "status: married"),
            User(name: "Maria", surname: "Pavlova", iconImage: UIImage(named: "woman")!,age: 23,hight: 169,status: "status: along"),
            User(name: "Liza", surname: "Kovalenko", iconImage: UIImage(named: "woman")!,age: 18,hight: 160,status: "status: in relationship"),
            User(name: "Tom", surname: "Soer", iconImage: UIImage(named: "man")!,age: 20,hight: 190,status: "status: along"),
            User(name: "Julia", surname: "Melnikova", iconImage: UIImage(named: "woman")!,age: 30,hight: 173,status: "status: married")
        ].sorted(by: {$0.name > $1.name})
    }
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        let nib = UINib(nibName: TableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier:TableViewCell.reuseIdentifier)
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshUsers(_:)), for: .valueChanged)
    }
}
