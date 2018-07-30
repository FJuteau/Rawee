//
//  UserSettingsCellModel.swift
//  Rawee
//
//  Created by François Juteau on 29/07/2018.
//  Copyright © 2018 rawee. All rights reserved.
//

import Foundation

class UserSettingsCellModel {
    let avatarImageURL: URL?
    let displayName: String?
    
    init(photoUrl: URL?, displayName: String?) {
        self.avatarImageURL = photoUrl
        self.displayName = displayName
    }
}
