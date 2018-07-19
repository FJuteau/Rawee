//
//  Model.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 25/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

protocol Model {
    static func parse(from response: [String: Any]) -> Model
}
