//
//  NewestProductsViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 16.02.2021.
//

import Foundation

protocol NewestProductsViewModelProtocol: class {
	var products: [Product] { get }
	func countOfProduct() -> Int
	func getData()
//	func cellViewModel(at indexPath: IndexPath) -> DiscoverCellViewModelProtocol?
//	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol?
}

class NewestProductsViewModel: NewestProductsViewModelProtocol {
	var products: [Product] = []
	
	func countOfProduct() -> Int {
		products.count
	}
	
	func getData() {
		sortFetchData(by: .newestProducts)
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
