//
//  CatalogCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 08.03.2021.
//

import UIKit

class CatalogCollectionViewController: UICollectionViewController {

	var viewModel: CatalogCollectionViewModelProtocol! {
		didSet {
			viewModel.getData()
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		viewModel = CatalogCollectionViewModel()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
								 numberOfItemsInSection section: Int) -> Int {
		viewModel.numberOfRows()
    }

    override func collectionView(_ collectionView: UICollectionView,
								 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
													  for: indexPath) as! CatalogCollectionViewCell
    
        // Configure the cell
    
        return cell
    }
}

extension CatalogCollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}
