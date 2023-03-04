//
//  ApiHelper.swift
//  Sphinx-solution-MachineTask
//
//  Created by Sejal on 04/03/23.
//

import Foundation
class ApiHelper{
    var userArray : [Users] = []
    var protocolref : GetUserProtocol?
    
    
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
            
            
            self.parseUsersData(responseData: responseData)
            
        }
        
        dataTask.resume()
        
    }
    
    func parseUsersData(responseData: Data){
        let decoder = JSONDecoder()
        do {
            let user: [Users] = try decoder.decode([Users].self, from: responseData)
            
            self.protocolref?.getusers(usersArray: user)

        }catch {
            print("JSONDecoder failed")
        }
        
    }
}

