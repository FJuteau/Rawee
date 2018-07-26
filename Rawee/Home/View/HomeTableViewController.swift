 //
//  HomeViewController.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 09/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

 protocol HomeTableViewControllerDelegate: class {
    func didSelect(productId: String)
 }

class HomeTableViewController: UICollectionViewController {

    let viewModel: HomeViewModel = HomeViewModel(repository: HomeRepository(webservices: HomeWebservices()))
    let dataSource: HomeTableViewDataSource = HomeTableViewDataSource()

    var delegate: HomeTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        bind(to: viewModel)

        collectionView?.register(HomeProductCollectionViewCell.nib, forCellWithReuseIdentifier: HomeProductCollectionViewCell.storyboardIdentifier)
        viewModel.viewDidLoad()
    }

    private func layout() {
        collectionView?.backgroundColor = .applicationBackground
        view.backgroundColor = .applicationBackground
        navigationController?.navigationBar.barTintColor = .raweeBackground
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.titleText]
        navigationController?.navigationBar.tintColor = .titleText
        
    }

    private func bind(to viewModel: HomeViewModel) {
        viewModel.products = { [weak self] products in
            self?.dataSource.products = products
            self?.collectionView?.reloadData()
        }
    }
    
    // MARK: - Static
    
    class var collectionViewFlowLayout: UICollectionViewLayout {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.size.width - 10) / 2
        let height = (width * 8) / 4
        collectionViewLayout.itemSize = CGSize(width: width, height: height)
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        return collectionViewLayout
    }
}

extension HomeTableViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numberOfProduct(in: section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeProductCollectionViewCell.storyboardIdentifier, for: indexPath) as? HomeProductCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(with: dataSource.product(at: indexPath))
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = dataSource.product(at: indexPath)
        delegate?.didSelect(productId: product.identifier)
    }
}
