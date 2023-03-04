//
//  HomeViewModel.swift
//  Sphinx-solution-MachineTask
//
//  Created by Sejal on 04/03/23.
//

import Foundation
class UserModelView: GetUserProtocol, GetPopulationProtocol {
    
    var userArray: [Users] = []
    var populationArray: [Population] = []

    var apihelper = ApiHelper()
    var uiUpdateUsersProtocol: UIUpdateUsersProtocol?
    var uiUpdatePopulationProtocol: UIUpdatePopulationProtocol?

    init(){
        apihelper.userProtocolref = self
        apihelper.populationProtocolref = self
    }
    
    func fetchUsersData(){
        apihelper.fetchApi(url: "https://gorest.co.in/public/v2/users", methodOfHttp: "GET", responseType: "Users")
    }
    
    func fetchPopulationData(){
        apihelper.fetchApi(url: "https://datausa.io/api/data?drilldowns=Nation&measures=Population", methodOfHttp: "GET", responseType: "Population")
    }
   
    func getusers(usersArray: [Users]) {
        self.userArray = usersArray
        uiUpdateUsersProtocol?.reloadDataOfUsers()
    }
    
    func getPopulation(populationArray: [Population]) {
        self.populationArray = populationArray
        uiUpdatePopulationProtocol?.reloadDataOfPopulation()
    }
}
    
   
    

