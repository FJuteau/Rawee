//
//  SettingsTableViewCell.swift
//  Rawee
//
//  Created by François Juteau on 28/07/2018.
//  Copyright © 2018 rawee. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: SettingsCellModel) {
        titleLabel.text = model.title
    }
}
