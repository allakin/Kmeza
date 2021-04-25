//
//  WishlistTableViewControllerViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 25.04.2021.
//

import Foundation

protocol WishlistTableViewControllerViewModelProtocol: class {
	var wishlists: [ProductInWishlist] { get }
	func countOfProduct() -> Int
	func getData()
//	func cellViewModel(at indexPath: IndexPath) -> FlashSaleCollectionCellViewModelProtocol?
//	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol?
}

class WishlistTableViewControllerViewModel: WishlistTableViewControllerViewModelProtocol {
	var wishlists: [ProductInWishlist] = []
	
	func countOfProduct() -> Int {
		wishlists.count
	}
	
	func getData() {
		GetWishlist.shared.getData()
	}
	
//	func cellViewModel(at indexPath: IndexPath) -> FlashSaleCollectionCellViewModelProtocol? {
//		<#code#>
//	}
//
//	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol? {
//		<#code#>
//	}
	
	
	
}
