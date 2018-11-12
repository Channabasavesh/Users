//
//  DataManager.swift
//  Users
//
//  Created by channabasavesh chandrappa budihal on 11/11/18.
//  Copyright © 2018 channabasavesh chandrappa budihal. All rights reserved.
//

import Foundation

class DataManager {
    
    var users = [User]()
    var namesArray: [String] = [String]()
    
    func getUsers(completionHandler: @escaping (NSError?)->Void) {
        guard let url = URL(string: Constants.jsonUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
            guard self != nil  else { return }
            guard let jsonData = data, error == nil else {
                print(error?.localizedDescription ?? Constants.Errors.responseError)
                return
            }
            do {
                let decoder = JSONDecoder()
                self?.users = try decoder.decode([User].self, from: jsonData)
                completionHandler(nil)
            }
            catch let parsingError {
                print(Constants.Errors.parseError, parsingError)
            }
        }
        task.resume()
    }
}
