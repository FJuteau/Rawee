//
//  HomeRepository.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 12/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

protocol HomeRepositoryType {
    func getHome(success: @escaping ((Home) -> Void), failure: @escaping ((Error) -> Void))
}

class HomeRepository: HomeRepositoryType {

    // MARK: Dependencies
    let webservices: HomeWebservicesType

    init(webservices: HomeWebservicesType) {
        self.webservices = webservices
    }
    
    func getHome(success: @escaping ((Home) -> Void), failure: @escaping ((Error) -> Void)) {
        webservices.getHome(success: { homeResponse in
            success(HomeParser.home(from: homeResponse))
        }) { error in
            failure(error)
        }
    }
}

class SuccessHomeRepository: HomeRepositoryType {

    func getHome(success: @escaping ((Home) -> Void), failure: @escaping ((Error) -> Void)) {
//        success(Home())
    }
}

class FailureHomeRepository: HomeRepositoryType {

    func getHome(success: @escaping ((Home) -> Void), failure: @escaping ((Error) -> Void)) {
        failure(RepositoryError())
    }
}
