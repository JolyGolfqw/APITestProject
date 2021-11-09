//
//  AuthNetwork.swift
//  APITest
//
//  Created by MacBook Pro on 30.10.2021.
//

import Foundation
import Alamofire

final class AuthNetwork {
    
    func alamofireRequest(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(urlString).responseData { response in
            if let error = response.error {
                completion(.failure(error as Error))
                return
            }
            
            guard let data = response.data else { return }
            completion(.success(data))
        }
    }
}
