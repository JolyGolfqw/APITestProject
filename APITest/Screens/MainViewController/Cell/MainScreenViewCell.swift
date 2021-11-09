//
//  MainScreenViewCell.swift
//  APITest
//
//  Created by MacBook Pro on 31.10.2021.
//

import UIKit

class MainScreenViewCell: UICollectionViewCell {

    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var moreDetailsLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    class var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.wrapperView.layer.cornerRadius = 15
        self.wrapperView.layer.borderWidth = 1
        self.wrapperView.layer.borderColor = #colorLiteral(red: 0.8823529412, green: 0.9098039216, blue: 0.9098039216, alpha: 1).cgColor
    }

}
