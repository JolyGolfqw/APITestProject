//
//  ListViewController.swift
//  APITest
//
//  Created by MacBook Pro on 30.10.2021.
//

import UIKit

final class ListViewController: UIViewController {
    
    var userModel: UsersModel!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIViews()
    }
    
    // MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.registerNib(UserAvatarTableViewCell.self)
        tableView.registerNib(UserInfoTableViewCell.self)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    func setupUIViews() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.right.equalToSuperview().offset(0)
            $0.height.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListScreenModel.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userAvatarCell = tableView.dequeue(UserAvatarTableViewCell.self, indexPath: indexPath)
        let userInfoCell = tableView.dequeue(UserInfoTableViewCell.self, indexPath: indexPath)
        
        
        let item = ListScreenModel(rawValue: indexPath.row)
        switch item {
        case .userAvatar:
            return userAvatarCell
        case .userName:
            userInfoCell.infoLabel.text = userModel.name
            return userInfoCell
        case .userEmail:
            userInfoCell.infoLabel.text = userModel.email
            return userInfoCell
        case .userDescription:
            userInfoCell.infoLabel.text = userModel.phone
            return userInfoCell
        default: return userAvatarCell
        }
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

