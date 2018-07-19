//
//  LibraryViewModel.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 07/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class LibraryViewModel {

    enum Item {
        case loading
        case logOut
        case noBooks
        case bookList(books: [LibraryBook])
    }

    enum Navigation {
        case goToSignIn
        case goToSignUp
        case goToBook(book: LibraryBook)
    }

    // MARK: Dependencies

    let userManager: UserManagerType
    let repository: LibraryRepositoryType

    // MARK: Properties

    var currentItem: Item = .loading {
        didSet {
            reloadDisplay?()
        }
    }

    // MARK: Life cycle

    init(userManager: UserManagerType, repository: LibraryRepositoryType) {
        self.userManager = userManager
        self.repository = repository
    }

    // MARK: Output
    var reloadDisplay: (() -> Void)?
    var navigateTo: ((Navigation) -> Void)?

    // MARK: Input
    func viewDidLoad() {
        displaysState(for: userManager.member)
    }

    func selectItem(at index: Int) {
        switch currentItem {
        case .bookList(let books):
            navigateTo?(.goToBook(book: books[index]))
        default:
            return
        }
    }
    func selectSignInButton() {

    }

    func selectSignUpButton() {

    }

    // MARK: Private

    private func bindToMember(userManager: UserManagerType) {
        userManager.addMemberListener { member in
            self.displaysState(for: member)
        }
    }

    private func displaysState(for member: Member?) {
        if let member = userManager.member {

            currentItem = .loading
            repository.getLibrary(for: member, success: { books in
                self.currentItem = .bookList(books: books)
                if books.isEmpty {
                    self.currentItem = .noBooks
                } else {
                    self.currentItem = .bookList(books: books)
                }
            }) { error in
                print(error)
            }
        } else {
            currentItem = .logOut
        }
    }
}
