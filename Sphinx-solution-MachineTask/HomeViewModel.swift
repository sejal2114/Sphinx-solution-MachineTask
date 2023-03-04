//
//  HomeViewModel.swift
//  Sphinx-solution-MachineTask
//
//  Created by Sejal on 04/03/23.
//

import Foundation
class HomeViewModel: GetUserProtocol {
    var userArray: Users
    var apiHelper = Apihelper()
    
    init(){
        apiHelper.protocolref = self
    }
    func fetchUsersData(){
        apihelper.fetchApi(url: "https://gorest.co.in/public/v2/users", methodOfHttp: "GET", responseType: "Users")
      }
    
    func getusers(usersArray: Users) {
      self.userArray = usersArray
      uiUpdateUsersProtocol?.reloadDataOfUsers()
        }
    }
    
    
   
    

