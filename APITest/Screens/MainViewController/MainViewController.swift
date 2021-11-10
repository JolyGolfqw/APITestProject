//
//  ViewController.swift
//  APITest
//
//  Created by MacBook Pro on 30.10.2021.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    let authDataFetcher = AuthDataFetcher()
    var usersModel = [UsersModel]()
    
    
    // MARK: - UI
    private let collectionView: UICollectionView = {
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .vertical
        layoutCollection.sectionInset.left = 12
        layoutCollection.sectionInset.right = 12
        layoutCollection.minimumLineSpacing = 10
        layoutCollection.minimumInteritemSpacing = 10
        layoutCollection.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 20)
        
        let height: CGFloat = 240.0
        let paddingItem: CGFloat = 10.0
        let widht = (UIScreen.main.bounds.width - (layoutCollection.sectionInset.left + layoutCollection.sectionInset.right + paddingItem)) / 2
        
        layoutCollection.itemSize = CGSize(width: widht, height: height)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutCollection)
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInset.top = 20
        collectionView.contentInset.bottom = 20
        collectionView.registerNib(MainScreenViewCell.self)
        
        return collectionView
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - Setup
extension MainViewController {
    
    func setup() {
        setupUIViews()
        getData()
    }
    
    func setupUIViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func goToListViewController(_ indexPath: IndexPath) {
        let listViewController = ListViewController()
        listViewController.userModel = self.usersModel[indexPath.row]
        navigationController?.pushViewController(listViewController, animated: true)
    }
    
    func getData() {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        self.authDataFetcher.fetchData(urlString: urlString) { (result) in
            
            DispatchQueue.main.async {
                self.usersModel = result
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(MainScreenViewCell.self, indexPath: indexPath)
   
        let users = usersModel[indexPath.row]
        cell.titleLabel.text = "\(users.id)"
        cell.infoLabel.text = users.email
        cell.moreDetailsLabel.text = users.name
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goToListViewController(indexPath)
    }
}

