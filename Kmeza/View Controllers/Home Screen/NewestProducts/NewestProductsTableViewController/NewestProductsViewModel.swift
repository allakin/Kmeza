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
	func cellViewModel(at indexPath: IndexPath) -> NewestProductsTableCellViewModelProtocol?
	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol?
}

class NewestProductsViewModel: NewestProductsViewModelProtocol {
	var products: [Product] = []
	
	func countOfProduct() -> Int {
		products.count
	}
	
	func getData() {
		products = Product.sortFetchData(by: .newestProducts)
	}
	
	func cellViewModel(at indexPath: IndexPath) -> NewestProductsTableCellViewModelProtocol? {
		let product = products[indexPath.row]
		return NewestProductsTableCellViewModel(product: product)
	}
	
	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol? {
		let product = products[indexPath.row]
		return ProductDetailViewModel(product: product)
	}
}
