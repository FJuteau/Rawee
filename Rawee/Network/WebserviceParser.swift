//
//  WebserviceParserWebserviceParser.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 24/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class WebserviceParser<T: Codable> {

    var success: ((T) -> Void)? 

    func parse(response: Data) {
        do {
            let model = try JSONDecoder().decode(T.self, from: response)
            success?(model)
        } catch {
            print(error)
        }
    }
}
