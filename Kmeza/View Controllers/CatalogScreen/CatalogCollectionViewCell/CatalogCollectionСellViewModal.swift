//
//  CatalogCollectionСellViewModal.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 10.03.2021.
//

import Foundation

protocol CatalogCollectionCellViewModelProtocol: class {
	var catalogImage: String { get }
	var catalogTitle: String { get }
	var nextPage: String { get }
	var previewsPage: String { get }
	init(catalog: Catalog)
}


class CatalogCollectionCellViewModel: CatalogCollectionCellViewModelProtocol {
	var catalogImage: String {
		catalog.image
	}
	
	var catalogTitle: String {
		catalog.title
	}
	
	var nextPage: String {
		catalog.nextPage
	}
	var previewsPage: String {
		catalog.previewsPage
	}
	
	private var catalog: Catalog
	
	required init(catalog: Catalog) {
		self.catalog = catalog
	}
	
}
