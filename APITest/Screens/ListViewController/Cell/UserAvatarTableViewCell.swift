//
//  UserAvatarTableViewCell.swift
//  APITest
//
//  Created by MacBook Pro on 01.11.2021.
//

import UIKit

class UserAvatarTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var avataImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.wrapperView.layer.cornerRadius = 15
        self.wrapperView.layer.borderWidth = 1
        self.wrapperView.layer.borderColor = #colorLiteral(red: 0.8823529412, green: 0.9098039216, blue: 0.9098039216, alpha: 1).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
