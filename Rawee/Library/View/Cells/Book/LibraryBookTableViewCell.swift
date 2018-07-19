//
//  LibraryBookTableViewCell.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 07/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class LibraryBookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    func configure(with book: LibraryBook) {
        titleLabel.text = book.title
        authorLabel.text = book.author
    }
}
