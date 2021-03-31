//
//  ProductThumbnailsCollectionViewCellViewModal.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 14.02.2021.
//

import Foundation

protocol ProductThumbnailsCollectionViewCellViewModalProtocol: class {
	init(images: ProductImage)
	func getImages() -> [String]
}


class ProductThumbnailsCollectionViewCellViewModal: ProductThumbnailsCollectionViewCellViewModalProtocol {
	private let images: ProductImage
	
	required init(images: ProductImage) {
		self.images = images
	}
	
	func getImages() -> [String] {
		var test: [String] = []
		test.append(images.image)
		return test
	}
	
}
