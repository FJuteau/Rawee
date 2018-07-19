//
//  ReaderCoordinator.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 07/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit
import FolioReaderKit

class ReaderCoordinator: Coordinator {

    let book: LibraryBook
    let presenter: UIViewController
//    let viewController: FolioReaderContainer

    init(presenter: UIViewController, book: LibraryBook) {
        self.presenter = presenter
        self.book = book
//        self.viewController = ReaderViewController.instance
//        viewController.prepare(withProductId: productId)
    }

    func start() {
        let config = FolioReaderConfig()
//        let bookPath = Bundle.main.path(forResource: "LeChatNoir", ofType: "epub")
        let folioReader = FolioReader()
//        folioReader.presentReader(parentViewController: presenter, withEpubPath: "/Users/francoisjuteau/Dev/TabBarCoordinator/TabBarCoordinator/Resources/LeChatNoir.epub", andConfig: config)
        let viewController = FolioReaderContainer(withConfig: config, folioReader: folioReader, epubPath: "/Users/francoisjuteau/Dev/TabBarCoordinator/TabBarCoordinator/Resources/LeChatNoir.epub")
        presenter.navigationController?.pushViewController(viewController, animated: true)
    }
}
