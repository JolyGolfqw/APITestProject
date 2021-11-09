//
//  AuthDataFetcher.swift
//  APITest
//
//  Created by MacBook Pro on 04.11.2021.
//

import Foundation

final class AuthDataFetcher {
    
    let authNetwork = AuthNetwork()
    
    func fetchData(urlString: String, completion: @escaping ([UsersModel]) -> Void) {
        authNetwork.alamofireRequest(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode([UsersModel].self, from: data)
                    completion(users)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion([])
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                completion([])
            }
        }
    }
}
