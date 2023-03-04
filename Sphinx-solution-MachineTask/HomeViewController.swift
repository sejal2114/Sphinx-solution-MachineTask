//
//  HomeViewController.swift
//  Sphinx-solution-MachineTask
//
//  Created by Sejal on 04/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var userModelView = UserModelView()
    
    @IBOutlet weak var UserTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userModelView.uiUpdateUsersProtocol = self
//           userModelView.populateData()
        userModelView.fetchUsersData()
           registerXib()
           setTableDelegate()
    }
    
    func setTableDelegate(){
        UserTableView.delegate = self
        UserTableView.dataSource = self
    }
    func registerXib() {
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        UserTableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
    }
}

}
extension ViewController :  UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        UserModelView.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        let product = productViewModel.productArray[indexPath.row]
        cell.productLabel.text = product.brand
        cell.titleLabel.text = product.title
        cell.priceLabel.text = "\(product.price)"
        return cell
        
    }
