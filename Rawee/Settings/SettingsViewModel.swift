//
//  SettingsViewModel.swift
//  Rawee
//
//  Created by François Juteau on 28/07/2018.
//  Copyright © 2018 rawee. All rights reserved.
//

import Foundation

class SettingsViewModel {
    
    enum Navigation {
        case loginScreen
    }
    
    enum Item {
        case login(model: SettingsCellModel)
    }
    
    let items: [Item]
    
    init() {
        self.items = [
            .login(model: SettingsCellModel(title: "Login"))
        ]
    }
    
    // MARK: - Output
    
    var navigateTo: ((Navigation) -> Void)?
    

    // MARK: - Input
    
    func selectItem(at index: Int) {
        switch items[index] {
        case .login:
            navigateTo?(.loginScreen)
        }
    }
}
