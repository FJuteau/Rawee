//
//  SettingsDataSource.swift
//  Rawee
//
//  Created by François Juteau on 29/07/2018.
//  Copyright © 2018 rawee. All rights reserved.
//

import Foundation

class SettingsDataSource {
    var items: [SettingsViewModel.Item] = []
    
    func numberOfItem(in section: Int) -> Int {
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> SettingsViewModel.Item {
        return items[indexPath.row]
    }
}
