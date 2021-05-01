//
//  WishlistTableViewControllerViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 25.04.2021.
//

import Foundation

protocol WishlistTableViewControllerViewModelProtocol: class {
	func countOfProduct() -> Int
	func getData()
	func cellViewModel(at indexPath: IndexPath) -> WishlistTableViewCellViewModelProtocol?
//	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol?
}

class WishlistTableViewControllerViewModel: WishlistTableViewControllerViewModelProtocol {
	
	func countOfProduct() -> Int {
		wishlists.count
	}
	
	func getData() {
		GetWishlist.shared.getData()
	}
	
	func cellViewModel(at indexPath: IndexPath) -> WishlistTableViewCellViewModelProtocol? {
		let wishlist = wishlists[indexPath.row]
		return WishlistTableViewCellViewModel(product: wishlist)
	}

	// TODO: - Сделать переход к экрану ProductDetailViewModel
//	func viewModelForSelectedRow(at indexPath: IndexPath) -> ProductDetailViewModelProtocol? {
//		let wishlist = wishlists[indexPath.row]
//		return ProductDetailViewModel(product: wishlist)
//	}
}
