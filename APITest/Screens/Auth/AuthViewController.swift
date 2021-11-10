//
//  AuthViewController.swift
//  APITest
//
//  Created by MacBook Pro on 30.10.2021.
//

import UIKit

final class AuthViewController: UIViewController {
    
    let token = "token"
    
    // MARK: - IBOUtlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Action
    @IBAction func goToMainVC(_ sender: UIButton) {
        
        if loginTextField.text?.count == 0, passwordTextField.text?.count == 0{
            emptyDataAlert()
            return
        } else if !isValidEmail(loginTextField.text ?? "") {
            authAlert()
            return
        }
        
        activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.activityIndicator.isHidden = false
            let mainViewController = MainViewController()
            self.navigationController?.setViewControllers([mainViewController], animated: true)
            self.activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = false
        }
        
        KeychainStorage.shared.setToken(token: token)
    }
}

// MARK: - Setup
extension AuthViewController {
    
    func setup() {
        
        loginButtonOutlet.layer.cornerRadius = 10
        loginButtonOutlet.clipsToBounds = true
        
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
    }
    
    func authAlert() {
        let alert = UIAlertController(title: "Wrong email", message: "Please validate your email", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func emptyDataAlert() {
        let alert = UIAlertController(title: "Заполните информацию", message: "Логин и пароль не должны быть пустыми", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}

// MARK: - Extension
private extension UIViewController {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
