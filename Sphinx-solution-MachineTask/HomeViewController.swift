//
//  HomeViewController.swift
//  Sphinx-solution-MachineTask
//
//  Created by Sejal on 04/03/23.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    var usermodelView = UserModelView()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var UserCollectionView: UICollectionView!
    @IBOutlet weak var populationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usermodelView.fetchUsersData()
        usermodelView.fetchPopulationData()
        usermodelView.uiUpdateUsersProtocol = self
        usermodelView.uiUpdatePopulationProtocol = self
        registerXib()
        setTableDelegate()
        setMapLocation()
    }
    
    func setMapLocation(){
//        var locationManager:CLLocationManager!
//        mapView.userLocation.location =
    }
    
    func setTableDelegate(){
        UserCollectionView.delegate = self
        UserCollectionView.dataSource = self
        
        populationTableView.delegate = self
        populationTableView.dataSource = self
    }
    func registerXib() {
        let nib = UINib(nibName: "UserCollectionViewCell", bundle: nil)
        UserCollectionView.register(nib, forCellWithReuseIdentifier: "UserCollectionViewCell")
        
        let nibTableCell = UINib(nibName: "PopulationTableViewCell", bundle: nil)
        populationTableView.register(nibTableCell, forCellReuseIdentifier: "PopulationTableViewCell")
    }
}
extension HomeViewController :  UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        usermodelView.userArray.count
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
extension HomeViewController: UIUpdateUsersProtocol, UIUpdatePopulationProtocol {
    func reloadDataOfPopulation() {
        DispatchQueue.main.async {
            self.populationTableView.reloadData()
        }
    }
    
    func reloadDataOfUsers() {
        DispatchQueue.main.async {
            self.UserCollectionView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usermodelView.populationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopulationTableViewCell", for: indexPath) as! PopulationTableViewCell
        let population = usermodelView.populationArray[indexPath.row]
        cell.countryNameLabel.text = population.nation
        cell.populationLabel.text = "Population is \(population.population)"
        cell.yearLabel.text = population.year
        return cell
    }
    
    
}
