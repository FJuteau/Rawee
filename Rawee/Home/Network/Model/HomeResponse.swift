//
//  HomeResponse.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

struct HomeResponse: Codable {
    let products: [ProductHomeResponse]
    
    init(data: [[String: Any]]) {
        products = data.compactMap { datum in
            guard let id = datum["id"] as? String,
                let banner = datum["banner"] as? String,
                let bookName = datum["bookName"] as? String,
                let thumb = datum["thumb"] as? String else { return nil }
            return ProductHomeResponse(id: id, banner: banner, bookName: bookName, thumb: thumb)
        }
    }
}
