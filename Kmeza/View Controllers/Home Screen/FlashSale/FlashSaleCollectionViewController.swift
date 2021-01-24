//
//  FlashSaleCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

import UIKit

class FlashSaleCollectionViewController: UICollectionViewController {
	
	let products = Product.products
	
	private var flashSaleProducts: [Product] = []
	private var isAddedToWishList = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		sortProducts(by: .flashSale)
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
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		performSegue(withIdentifier: "showDetail", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
			if let indexPath = collectionView.indexPathsForSelectedItems?.first {
				let detailsVC = segue.destination as? ProductDetailViewController
				detailsVC?.product = flashSaleProducts[indexPath.item]
			}
		}
	}

	private func sortProducts(by type: ProductType) {
		products.forEach { (product) in
			if product.productType == type.rawValue {
				let product = Product(cover: product.cover,
									  typeCollection: product.typeCollection,
									  productType: product.productType,
									  title: product.title,
									  price: product.price,
									  sale: product.sale,
									  numberStock: product.numberStock,
									  numberOfProducts: product.numberOfProducts,
									  productInformation: product.productInformation)
				flashSaleProducts.append(product)
			}
		}
	}
	
}

extension FlashSaleCollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
	}
}
