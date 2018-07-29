//
//  ProductSheetResponse.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

struct ProductSheetResponse: Codable {
    let id: String
    let bookName: String
    let bookDesc: String
    let banner: String
    
    init?(data: [String: Any]) {
        guard let id = data["id"] as? String,
            let bookName = data["bookName"] as? String,
            let bookDesc = data["bookDesc"] as? String,
            let banner = data["banner"] as? String else { return nil }
        
        self.id = id
        self.bookName = bookName
        self.bookDesc = bookDesc
        self.banner = banner
    }
}

