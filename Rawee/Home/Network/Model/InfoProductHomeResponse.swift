//
//  InfoHomeResponse.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 25/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

struct InfoProductHomeResponse: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let content: String
}
