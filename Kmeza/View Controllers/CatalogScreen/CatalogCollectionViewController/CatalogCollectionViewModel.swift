//
//  CatalogCollectionViewModel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 09.03.2021.
//

import Foundation

protocol CatalogCollectionViewModelProtocol: class {
	var catalogs: [Catalog] { get }
	func numberOfRows() -> Int
	func getData()
	func cellViewModel(at indexPath: IndexPath) -> CatalogCollectionCellViewModel?
//	func viewModelForSelectedRow(at indexPath: IndexPath) -> СatalogueOutfitsCollectionViewModalProtocol?
}

class CatalogCollectionViewModel: CatalogCollectionViewModelProtocol {
	
	var catalogs: [Catalog] = []
	
	func numberOfRows() -> Int {
		catalogs.count
	}
	
	func getData() {
		catalogs = Catalog.categories
	}
	
	func cellViewModel(at indexPath: IndexPath) -> CatalogCollectionCellViewModel? {
		let catalog = catalogs[indexPath.item]
		return CatalogCollectionCellViewModel(catalog: catalog)
	}
	
//	func viewModelForSelectedRow(at indexPath: IndexPath) -> СatalogueOutfitsCollectionViewModalProtocol? {
//		let catalog = catalogs[indexPath.item]
//	}
}
