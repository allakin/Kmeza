//
//  ProductDetailCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 17.01.2021.
//

import UIKit

class ProductDetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	var viewModel: ProductDetailCollectionViewModalProtocol!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView,
								 numberOfItemsInSection section: Int) -> Int {
		viewModel.numberOfRows()
	}
	
	override func collectionView(_ collectionView: UICollectionView,
								 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
													  for: indexPath) as! ProductDetailCollectionViewCell
		
		cell.viewModel = viewModel.cellViewModel(at: indexPath)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		let itemWidth = view.bounds.width
		let itemHeight = view.bounds.height
		
		return CGSize(width: itemWidth, height: itemHeight)
	}
}
