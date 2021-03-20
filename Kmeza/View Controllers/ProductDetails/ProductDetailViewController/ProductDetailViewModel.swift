//
//  ProductDetailViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 13.02.2021.
//

import Foundation

protocol ProductDetailViewModelProtocol: class {
	var name: String { get }
	var collectionType: String { get }
	var numberOfReviews: String { get }
	var brandName: String { get }
	var productWeight: String { get }
	var conditionType: String { get }
	var categoryType: String { get }
	var typeCloths: String { get }
	var description: String { get }
	var price: String { get }
	var sale: String { get }
	var productInformation: InformationOfProduct { get }
	init(product: Product)
}

class ProductDetailViewModel: ProductDetailViewModelProtocol {
	var name: String {
		product.name
	}
	
	var collectionType: String {
		product.typeCollection
	}
	
	var numberOfReviews: String {
		"(\(product.productInformation.numberOfReviews) Reviews)"
	}
	
	var brandName: String {
		product.productInformation.specification.brand
	}
	
	var productWeight: String {
		product.productInformation.specification.weight
	}
	
	var conditionType: String {
		product.typeCollection
	}
	
	var categoryType: String {
		product.productInformation.specification.category
	}
	
	var typeCloths: String {
		product.productInformation.specification.typeCloths
	}
	
	var description: String {
		product.productInformation.description
	}
	
	var price: String {
		product.numberOfProducts >= product.numberStock ? "SOLD" : "$\(product.price)"
	}
	
	var sale: String {
		"$\(product.sale)"
	}
	
	var productInformation: InformationOfProduct {
		product.productInformation
	}
	
	private let product: Product
	
	required init(product: Product) {
		self.product = product
	}
}
