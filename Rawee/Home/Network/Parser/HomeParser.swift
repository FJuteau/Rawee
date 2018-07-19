//
//  HomeParser.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 24/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class HomeParser {
    class func home(from homeResponse: HomeResponse) -> Home {
        return Home(from: homeResponse)
    }
}
