//
//  UserSettingsTableViewCell.swift
//  Rawee
//
//  Created by François Juteau on 29/07/2018.
//  Copyright © 2018 rawee. All rights reserved.
//

import UIKit

class UserSettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    func configure(with model: UserSettingsCellModel) {
        if let url = model.avatarImageURL {
            avatarImageView.setImageWithURL(url)
        } else {
            avatarImageView.image = UIImage(named: "placeHolder")
        }
        
        userNameLabel.text = model.displayName
    }
    
}
