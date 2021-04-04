//
//  DiscoverCellViewModel.swift
//  Pods
//
//  Created by Pavel Anpleenko on 07.02.2021.
//

import Foundation

protocol DiscoverCellViewModelProtocol: class {
	var image: String { get }
	var collectionType: String { get }
	var title: String { get }
	var price: String { get }
	var sale: String { get }
	var isAddedToWishList: Box<Bool> { get }
	init(product: Product)
	func changeAddToWishListStatus()
}

class DiscoverCellViewModel: DiscoverCellViewModelProtocol {
	var image: String {
		product.cover
	}
	
	var collectionType: String {
		product.typeCollection.uppercased()
	}
	
	var title: String {
		product.name
	}
	
	var price: String {
		"$\(product.price)"
	}
	
	var sale: String {
		"$\(product.sale)"
	}
	
	var isAddedToWishList: Box<Bool>
	
	private let product: Product
	
	required init(product: Product) {
		self.product = product
		isAddedToWishList = Box(value: false)
	}
	
	func changeAddToWishListStatus() {
		isAddedToWishList.value.toggle()
		
		if isAddedToWishList.value {
			SaveDataInFirebase.shared.saveData(data: getData())
		} else {
			RemoveDataFromFirebase.shared.removeData(name: title)
		}
	}
	
	private func getData() -> [String: Any] {
		["cover": "",
		 "typeCollection": "",
		 "productType": "",
		 "name": title,
		 "price": price,
		 "sale": sale,
		 "numberStock": 0,
		 "numberOfProducts": 0,
		 "numberOfReviews": 0,
		 "description": "",
		 "thumbnails": [["image": ""],
						["image": ""],
						["image": ""],
						["image": ""]],
		 "colorPickers": [["red": 0.0, "green": 0.0, "blue": 0.0],
						  ["red": 0.0, "green": 0.0, "blue": 0.0],
						  ["red": 0.0, "green": 0.0, "blue": 0.0],
						  ["red": 0.0, "green": 0.0, "blue": 0.0],
						  ["red": 0.0, "green": 0.0, "blue": 0.0]],
		 "specification": ["brand": "",
						   "weight": "",
						   "condition": "",
						   "category": "",
						   "typeCloths": ""],
		 "sizes": [["size": "S"],
				   ["size": "M"],
				   ["size": "L"],
				   ["size": "XL"],
				   ["size": "XXL"]]]
	}
}
