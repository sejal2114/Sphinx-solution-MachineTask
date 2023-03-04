//
//  ApiHelper.swift
//  Sphinx-solution-MachineTask
//
//  Created by Sejal on 04/03/23.
//

import Foundation
class Apihelper{
    var userArray : Users?
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
            
            
            func parseUsersData(responseData: Data){
                let decoder = JSONDecoder()
                do {
                    let user: Users = try decoder.decode(Users.self, from: responseData)
                    
                    
                }catch {
                    print("JSONDecoder failed")
                }
                self.protocolref?.getusers(usersArray: self.userArray!)
                
            }
            
        }
        
        
        
    }