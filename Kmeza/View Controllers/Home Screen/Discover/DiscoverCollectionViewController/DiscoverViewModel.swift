//
//  DiscoverViewModel.swift
//  Ktargetmeza
//
//  Created by Pavel Anpleenko on 06.02.2021.
//

import Foundation

protocol DiscoverViewModelProtocol: class {
	var products: [Product] { get }
	func numberOfRows() -> Int
	func getData()
	func cellViewModel(at indexPath: IndexPath) -> DiscoverCellViewModelProtocol?
	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol?
}

class DiscoverViewModel: DiscoverViewModelProtocol {
	var products: [Product] = []
	
	func numberOfRows() -> Int {
		products.count
	}
	
	func getData() {
		sortFetchData(by: .discover)
	}
	
	func cellViewModel(at indexPath: IndexPath) -> DiscoverCellViewModelProtocol? {
		let product = products[indexPath.item]
		return DiscoverCellViewModel(product: product)
	}
	
	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol? {
		let product = products[indexPath.item]
		return ProductDetailViewModel(product: product)
	}
	
	private func sortFetchData(by type: ProductType) {
		fetchData().forEach { (product) in
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
				products.append(product)
			}
		}
	}
	
	private func fetchData() -> [Product] {
		Product.products
	}
}
