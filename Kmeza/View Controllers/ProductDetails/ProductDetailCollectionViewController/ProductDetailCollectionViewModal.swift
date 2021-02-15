//
//  ProductDetailCollectionViewModal.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 14.02.2021.
//

import Foundation

protocol ProductDetailCollectionViewModalProtocol: class {
	var images: [ProductImage] { get }
	init(productImages: [ProductImage])
	func numberOfRows() -> Int
	func cellViewModel(at indexPath: IndexPath) -> ProductDetailCollectionCellViewModelProtocol?
}


class ProductDetailCollectionViewModal: ProductDetailCollectionViewModalProtocol {
	var images: [ProductImage] {
		productImages
	}
	
	private let productImages: [ProductImage]
	required init(productImages: [ProductImage]) {
		self.productImages = productImages
	}
	
	func numberOfRows() -> Int {
		productImages.count
	}
	
	func cellViewModel(at indexPath: IndexPath) -> ProductDetailCollectionCellViewModelProtocol? {
		let image = productImages[indexPath.item]
		return ProductDetailCollectionCellViewModel(images: image)
	}
}
