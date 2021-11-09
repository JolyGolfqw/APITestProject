//
//  OnboardViewController.swift
//  APITest
//
//  Created by MacBook Pro on 30.10.2021.
//

import UIKit

final class OnboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToAuth(_ sender: Any) {
        let authViewController = UIStoryboard.get(AuthViewController.self)
        self.navigationController?.setViewControllers([authViewController], animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                        
        // hide navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // вызывается перед уходом
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }
}
