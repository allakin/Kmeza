//
//  FlashSaleCollectionViewControllerViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 19.02.2021.
//

import Foundation

protocol FlashSaleCollectionViewControllerViewModelProtocol: class {
	var products: [Product] { get }
	func countOfProduct() -> Int
	func getData()
	func cellViewModel(at indexPath: IndexPath) -> FlashSaleCollectionCellViewModelProtocol?
	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol?
}


class FlashSaleCollectionViewControllerViewModel: FlashSaleCollectionViewControllerViewModelProtocol {
	var products: [Product] = []
	
	func countOfProduct() -> Int {
		products.count
	}
	
	func getData() {
		products = Product.sortFetchData(by: .flashSale)
	}
	
	func cellViewModel(at indexPath: IndexPath) -> FlashSaleCollectionCellViewModelProtocol? {
		let product = products[indexPath.row]
		return FlashSaleCollectionCellViewModel(product: product)
	}

	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol? {
		let product = products[indexPath.row]
		return ProductDetailViewModel(product: product)
	}
}
