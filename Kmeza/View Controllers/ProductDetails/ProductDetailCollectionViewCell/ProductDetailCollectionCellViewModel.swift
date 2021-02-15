//
//  ProductDetailCollectionCellViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 14.02.2021.
//

import Foundation

protocol ProductDetailCollectionCellViewModelProtocol: class {
	init(images: ProductImage)
	func getImages() -> [String]
}


class ProductDetailCollectionCellViewModel: ProductDetailCollectionCellViewModelProtocol {
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
