//
//  FlashSaleCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

import UIKit

class FlashSaleCollectionViewController: UICollectionViewController {
	
	let flashSaleProducts = FlashSaleProduct.flashSaleProducts
	
	private var isAddedToWishList = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("+++++++++++")
		
		print(flashSaleProducts.count)
	}
	
	
	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView,
								 numberOfItemsInSection section: Int) -> Int {
		return flashSaleProducts.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FlashSaleCollectionViewCell
		
		let flashSaleProduct = flashSaleProducts[indexPath.item]
		cell.configureContant(product: flashSaleProduct)
		
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
}

extension FlashSaleCollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
	}
}
