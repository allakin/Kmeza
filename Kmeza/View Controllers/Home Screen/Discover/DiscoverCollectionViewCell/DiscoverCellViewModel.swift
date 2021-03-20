//
//  DiscoverCellViewModel.swift
//  Pods
//
//  Created by Pavel Anpleenko on 07.02.2021.
//

import Foundation

protocol DiscoverCellViewModelProtocol: class {
	var image: String { get }
	var collectionType: String { get }
	var title: String { get }
	var price: String { get }
	var sale: String { get }
	var isAddedToWishList: Box<Bool> { get }
	init(product: Product)
	func changeAddToWishListStatus()
}

class DiscoverCellViewModel: DiscoverCellViewModelProtocol {
	var image: String {
		product.cover
	}

	var collectionType: String {
		product.typeCollection.uppercased()
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
	
	var isAddedToWishList: Box<Bool>
	
	private let product: Product

	required init(product: Product) {
		self.product = product
		isAddedToWishList = Box(value: false)
	}
	
	func changeAddToWishListStatus() {
		isAddedToWishList.value.toggle()
	}
}
