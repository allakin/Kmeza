//
//  NewestProductsTableCellViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 16.02.2021.
//

import Foundation

protocol NewestProductsTableCellViewModelProtocol: class {
	var image: String { get }
	var title: String { get }
	var price: String { get }
	var sale: String { get }
	var numberOfReviews: String { get }
	var isAddedToWishList: Box<Bool> { get }
	init(product: Product)
	func changeAddToWishListStatus()
}

class NewestProductsTableCellViewModel: NewestProductsTableCellViewModelProtocol {
	var image: String {
		product.cover
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
		"(\(product.productInformation.numberOfReviews) Reviews)"
	}
	
	var isAddedToWishList: Box<Bool>
	
	private let product: Product
	
	required init(product: Product) {
		self.product = product
		isAddedToWishList = Box(value: false)
	}
	
	func changeAddToWishListStatus() {
		isAddedToWishList.value.toggle()
		
		DataTemplate.shared.saveOrRemoveProductInWishlistFromFirebase(isAdded: isAddedToWishList,
																	  product: product)
	}
}
