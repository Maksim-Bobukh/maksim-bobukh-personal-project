//
//  TableViewViewController.swift
//  MyFinalProject
//
//  Created by Максим on 22.11.2021.
//

import UIKit
import Alamofire
import Kingfisher

class TableViewViewController:UIViewController{
    
    private var phohos: [PhotoDescription] = []
    private let url = "https://jsonplaceholder.typicode.com/photos"
    
    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        self.fetchData()
    }
    
    private func fetchData() {
        AF.request(self.url,method: .get).responseDecodable(of: [PhotoDescription].self) { [weak self] response in
            self?.phohos = response.value ?? []
            self?.tableView.reloadData()
        }
    }
    
    @objc private func refreshUsers(_ sender: UIRefreshControl){
        phohos .shuffle()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {[weak self] in
            sender.endRefreshing()
            self?.tableView.reloadData()
        }
    }
}
    
extension TableViewViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosInf = phohos[indexPath.row]

        pushUserVC(photoDetails: photosInf)
    }
    func pushUserVC(photoDetails:PhotoDescription){

        let storyboard = UIStoryboard(name: "SelectedPhoto", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "SelectedPhotoViewController") as! SelectedPhotoViewController
        viewController.photo = photoDetails
        self.navigationController?.pushViewController(viewController, animated: true)

    }
}

extension TableViewViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phohos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell{
            cell.photo = phohos[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

private extension TableViewViewController{
    
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        let nib = UINib(nibName: TableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier:TableViewCell.reuseIdentifier)
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshUsers(_:)), for: .valueChanged)
    }
}



