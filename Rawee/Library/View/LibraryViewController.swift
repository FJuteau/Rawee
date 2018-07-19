//
//  LibraryViewController.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 07/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

protocol LibraryBookViewControllerDelegate: class {
    func didSelectBook(book: LibraryBook)
}

final class LibraryViewController: UITableViewController {

    lazy var viewModel: LibraryViewModel = {
        return LibraryViewModel(userManager: UserManager.current, repository: MockLibraryRepository())
    }()

    var delegate: LibraryBookViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        viewModel.viewDidLoad()

        tableView.register(LibraryBookTableViewCell.nib, forCellReuseIdentifier: LibraryBookTableViewCell.storyboardIdentifier)
    }

    private func bind(to viewModel: LibraryViewModel) {
        viewModel.reloadDisplay = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.navigateTo = { [weak self] navigate in
            switch navigate {
            case .goToBook(let book):
                self?.delegate?.didSelectBook(book: book)
            default:
                print(navigate)
            }
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.currentItem {
        case .bookList(let books):
            return books.count
        default:
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.currentItem {
        case .bookList(let books):
            return libraryBookTableViewCell(from: books, for: indexPath)
        default:
            return UITableViewCell()
        }
    }

    private func libraryBookTableViewCell(from books: [LibraryBook], for indexPath: IndexPath) -> LibraryBookTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LibraryBookTableViewCell.storyboardIdentifier, for: indexPath) as? LibraryBookTableViewCell else { assertionFailure(); return LibraryBookTableViewCell() }
        cell.configure(with: books[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.currentItem {
        case .bookList:
             viewModel.selectItem(at: indexPath.row)
        default:
            print("TO IMPLEMENT")
        }

    }

}
