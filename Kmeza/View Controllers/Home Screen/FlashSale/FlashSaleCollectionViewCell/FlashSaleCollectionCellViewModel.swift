//
//  FlashSaleCollectionCellViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 19.02.2021.
//

import Foundation

protocol FlashSaleCollectionCellViewModelProtocol: class {
	var image: String { get }
	var title: String { get }
	var price: String { get }
	var numberStockProducts: String { get }
	var leftStockProducts: Float { get }
	var numberOfReviews: String { get }
	var isAddedToWishList: Box<Bool> { get }
	init(product: Product)
	func changeAddToWishListStatus()
}

class FlashSaleCollectionCellViewModel: FlashSaleCollectionCellViewModelProtocol {
	
	var image: String {
		product.cover
	}
	
	var title: String {
		product.title
	}
	
	var price: String {
		product.numberOfProducts >= product.numberStock ? "SOLD" : "$\(product.price)"
	}
	
	var numberStockProducts: String {
		configureLeftCountProducts(product.numberOfProducts, product.numberStock)
	}
	
	var leftStockProducts: Float {
		configureProgressView(number: product.numberOfProducts, product.numberStock)
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
	}
	
	private func configureLeftCountProducts(_ number: Int, _ count: Int) -> String {
		number >= count ? "0 Left" : "\(number) Left"
	}
	
	private func configureProgressView(number: Int, _ count: Int) -> Float {
		var result: Float = 0
		
		if number <= count {
			let leftProduct = Float(Double(count - number) / Double(count))
			result += leftProduct
		} else {
			result += 1
		}

		return result
	}
}
