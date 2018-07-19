//
//  HomeViewModel.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 12/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class HomeViewModel {

    // MARK: - Properties

    var home: Home?

    // Mark: - Dependencies
    let repository: HomeRepositoryType

    init(repository: HomeRepositoryType) {
        self.repository = repository
    }


    // MARK: - Outputs

    var products: (([ProductHome]) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        repository.getHome(success: { home in
            self.home = home
            self.products?(home.products)
        }) { error in
            print(error)
        }
    }

    func didSelectProduct(at index: IndexPath) {

    }

}
