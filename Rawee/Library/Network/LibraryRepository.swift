//
//  LibraryRepository.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 07/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

protocol LibraryRepositoryType {
    func getLibrary(for member: Member, success: (([LibraryBook]) -> Void), failure: ((Error) -> Void))
}

class MockLibraryRepository: LibraryRepositoryType {

    func getLibrary(for member: Member, success: (([LibraryBook]) -> Void), failure: ((Error) -> Void)) {
        if member.id == 0 {
            let books: [LibraryBook] = [LibraryBook(identifier: 0, title: "first one", author: "Norah"),
                                        LibraryBook(identifier: 1, title: "second one", author: "Norah")]
            success(books)
        } else {
            failure(RepositoryError())
        }
    }
    
}
