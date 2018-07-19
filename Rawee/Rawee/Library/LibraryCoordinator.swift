//
//  LibraryCoordinator.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 07/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class LibraryCoordinator: Coordinator {

    let presenter: UINavigationController
    let viewController: LibraryViewController

    var readerCoordinator: ReaderCoordinator?

    init() {
        self.viewController = LibraryViewController()
        self.presenter = UINavigationController(rootViewController: viewController)
        viewController.delegate = self
        viewController.title = "Library"
        viewController.view.backgroundColor = .red
    }

    func start() {
        
    }
}

extension LibraryCoordinator: LibraryBookViewControllerDelegate {
    func didSelectBook(book: LibraryBook) {
        let readerCoordinator = ReaderCoordinator(presenter: viewController, book: book)
        readerCoordinator.start()

        self.readerCoordinator = readerCoordinator
    }
}
