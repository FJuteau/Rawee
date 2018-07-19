//
//  ProductSheetViewModel.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class ProductSheetViewModel {

    // MARK: Dependency
    let repository: ProductSheetRepositoryType
    let productId: Int

    init(repository: ProductSheetRepositoryType, productId: Int) {
        self.repository = repository
        self.productId = productId
    }
    
    // MARK: - Output

    var titleText: ((String) -> Void)?
    var imageURL: ((URL) -> Void)?
    var descriptionText: ((String) -> Void)?
    var authorNickname: ((String) -> Void)?
    var priceText: ((String) -> Void)?
    var purchaseButtonText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        repository.getProductSheet(from: productId, success: { productSheet in
            self.titleText?(productSheet.title)
            self.descriptionText?(productSheet.description)
            self.authorNickname?(productSheet.authorNickname)
            self.priceText?(productSheet.authorNickname)
            self.purchaseButtonText?("PURCHASE")
            if let imageURL = productSheet.imageURL {
                self.imageURL?(imageURL)
            }
        }) { error in
            print(error)
        }
    }

    func didSelectPurshaseButton() {
        
    }
}
