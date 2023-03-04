//
//  ApiHelper.swift
//  Sphinx-solution-MachineTask
//
//  Created by Sejal on 04/03/23.
//

import Foundation
class ApiHelper{
    var userArray : [Users] = []
    var populationArray : [Population] = []

    var userProtocolref : GetUserProtocol?
    var populationProtocolref : GetPopulationProtocol?

    
    func fetchApi(url:String, methodOfHttp:String, responseType: String){
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = methodOfHttp
        
        let urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            guard let responseData = data else {
                return
            }
            
            if responseType == "Users" {
                self.parseUsersData(responseData: responseData)
            } else {
                self.parsePopulationData(responseData: responseData)
            }
        }
        
        dataTask.resume()
        
    }
    
    func parseUsersData(responseData: Data){
        
        let getJSONDictonary = try! JSONSerialization.jsonObject(with: responseData) as! [[String : Any]]
        
        for jsonObject in getJSONDictonary{
            
            let id = jsonObject["id"] as? Int ?? 0
            let name = jsonObject["name"] as! String
            let gender = jsonObject["gender"] as! String
            
            let newUser = Users(id: id, name: name, gender: gender)
            
            self.userArray.append(newUser)
        }
        self.userProtocolref?.getusers(usersArray: userArray)
    }
    
    func parsePopulationData(responseData: Data){
        
        let decoder = JSONDecoder()
              do {
                  let populationRoot: PopulationRoot = try decoder.decode(PopulationRoot.self, from: responseData)
                  
                  self.populationProtocolref?.getPopulation(populationArray: populationRoot.data)
                
              }catch {
                  print("JSONDecoder failed")
              }
              
          }
}

