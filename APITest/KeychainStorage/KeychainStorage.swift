//
//  KeychainStorage.swift
//  APITest
//
//  Created by MacBook Pro on 05.11.2021.
//

import Foundation
import KeychainSwift

final class KeychainStorage {
    
    private let keychain = KeychainSwift()
    
    func setToken(token: String) {
        keychain.set(token, forKey: "token")
    }
    
    func getToken() -> String? {
        keychain.get("token")
    }
    
    func clear() {
        keychain.clear()
    }
    
    private init() {}
    static let shared = KeychainStorage()
}
