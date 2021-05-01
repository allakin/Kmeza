//
//  WishlistTableViewCellViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 25.04.2021.
//

import Foundation

protocol WishlistTableViewCellViewModelProtocol: class {
	var image: String { get }
	var collectionType: String { get }
	var title: String { get }
	var price: String { get }
	var sale: String { get }
	var numberOfReviews: String { get }
//	var isAddedToWishList: Box<Bool> { get }
	init(product: ProductInWishlist)
//	func changeAddToWishListStatus()
}

class WishlistTableViewCellViewModel: WishlistTableViewCellViewModelProtocol {
	
	var image: String {
		product.cover
	}
	
	var collectionType: String {
		product.typeCollection
	}
	
	var title: String {
		product.name
	}
	
	var price: String {
		"$\(product.price)"
	}
	
	var sale: String {
		"$\(product.sale)"
	}
	
	var numberOfReviews: String {
		"\(product.productInformation.numberOfReviews) Reviews"
	}
	
	private let product: ProductInWishlist
	
	required init(product: ProductInWishlist) {
		self.product = product
	}
	

}
