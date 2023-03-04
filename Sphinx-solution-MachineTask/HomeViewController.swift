//
//  HomeViewController.swift
//  Sphinx-solution-MachineTask
//
//  Created by Sejal on 04/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    var usermodelView = UserModelView()
    
    @IBOutlet weak var UserCollectionView: UICollectionView!
    @IBOutlet weak var populationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    usermodelView.fetchUsersData()
        usermodelView.uiUpdateUsersProtocol = self
        registerXib()
        setTableDelegate()
    }
    
    func setTableDelegate(){
        UserCollectionView.delegate = self
        UserCollectionView.dataSource = self
    }
    func registerXib() {
        let nib = UINib(nibName: "UserCollectionViewCell", bundle: nil)
        UserCollectionView.register(nib, forCellWithReuseIdentifier: "UserCollectionViewCell")
        
        
    }
}
extension HomeViewController :  UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
        let user = usermodelView.userArray[indexPath.row]
        cell.idLabel.text = "\(user.id)"
        cell.nameLabel.text = user.name
        cell.genderLabel.text = user.gender
       
        return cell
        
    }
}
extension HomeViewController: UIUpdateUsersProtocol {
    func reloadDataOfUsers() {
        DispatchQueue.main.async {
            self.UserCollectionView.reloadData()
        }
    }
}

