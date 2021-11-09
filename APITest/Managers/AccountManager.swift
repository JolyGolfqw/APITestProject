//
//  AccountManager.swift
//  APITest
//
//  Created by MacBook Pro on 30.10.2021.
//

import Foundation

final class AccountManager {
    
    var firstName: String {
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "kFirstName")
        }
        
        get {
            return UserDefaults.standard.string(forKey: "kFirstName") ?? ""
        }
    }
    
    var lastName: String {
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "kLastName")
        }
        
        get {
            return UserDefaults.standard.string(forKey: "kLastName") ?? ""
        }
    }
    
    var email: String {
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "kEmail")
        }
        
        get {
            return UserDefaults.standard.string(forKey: "kEmail") ?? ""
        }
    }
    
    var password: String {
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "kPassword")
        }
        
        get {
            return UserDefaults.standard.string(forKey: "kPassword") ?? ""
        }
    }
    
    var isAuth: Bool {
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "kIsAuth")
        }
        
        get {
            UserDefaults.standard.bool(forKey: "kIsAuth") 
        }
    }
}
