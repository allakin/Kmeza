//
//  DiscoverCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

import UIKit

class DiscoverCollectionViewController: UICollectionViewController {
	
	let discoverProducts = Product.products
	private var isAddedToWishList = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView,
								 numberOfItemsInSection section: Int) -> Int {
		discoverProducts.count
	}
	
	override func collectionView(_ collectionView: UICollectionView,
								 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DiscoverCollectionViewCell
		
		let discoverProduct = discoverProducts[indexPath.item]
		cell.configureContant(with: discoverProduct)
		
		cell.buttonTapAction = { () in
			if self.isAddedToWishList {
				self.isAddedToWishList.toggle()
				cell.addToWishListButton.setImage(UIImage(named: "AddToWishList_White"), for: .normal)
			} else {
				self.isAddedToWishList.toggle()
				cell.addToWishListButton.setImage(UIImage(named: "AddToWishListPressed_White"), for: .normal)
			}
		}
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		performSegue(withIdentifier: "showDetail", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
			if let indexPath = collectionView.indexPathsForSelectedItems?.first {
				let detailsVC = segue.destination as? ProductDetailViewController
				detailsVC?.product = discoverProducts[indexPath.item]
			}
		}
	}
}

extension DiscoverCollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
	}
}
