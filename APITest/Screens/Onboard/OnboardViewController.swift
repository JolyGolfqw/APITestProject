//
//  OnboardViewController.swift
//  APITest
//
//  Created by MacBook Pro on 30.10.2021.
//

import UIKit

final class OnboardViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var goButtonOutlet: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButtonOutlet.layer.cornerRadius = 10
        goButtonOutlet.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - IBAction
    @IBAction func goToAuth(_ sender: Any) {
        let authViewController = UIStoryboard.get(AuthViewController.self)
        self.navigationController?.setViewControllers([authViewController], animated: true)
    }
}
