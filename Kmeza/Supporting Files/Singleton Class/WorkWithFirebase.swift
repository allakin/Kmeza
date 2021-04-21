//
//  WorkWithFirebase.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 03.04.2021.
//

import Firebase
import Alamofire

class WorkWithFirebase {
	func databaseReference() -> DatabaseReference {
		Database.database().reference()
	}
	
	func getUserID() -> String {
		guard let userID = Auth.auth().currentUser?.uid else { return "" }
		return userID
	}
	
	func getKeyID() -> String? {
		databaseReference().childByAutoId().key
	}
	
	func getKeyFromStore(key: StoreKey) -> String {
		switch key {
		case .labelArticle:
			return "labelArticle"
		case .keyID:
			return "keyID"
		}
	}
}

enum StoreKey {
	case labelArticle
	case keyID
}

class SaveDataInFirebase: WorkWithFirebase {
	static let shared = SaveDataInFirebase()
	
	private override init() {}
	
	func saveData(data: [String: Any]) {
		guard let name = data["name"] as? String else { return }
		databaseReference().child("wishlist_userID__\(getUserID())__").child(name).setValue(data)
	}
}

class RemoveDataFromFirebase: WorkWithFirebase {
	static let shared = RemoveDataFromFirebase()
	
	private override init() {}
	
	func removeData(name: String) {
		databaseReference().child("wishlist_userID__\(getUserID())__").child(name).removeValue()
	}
}


class DataTemplate {
	static let shared = DataTemplate()
	
	private init() {}
	
	func saveOrRemoveProductInWishlistFromFirebase(isAdded: Box<Bool>, product: Product) {
		if isAdded.value {
			SaveDataInFirebase.shared.saveData(data: DataTemplate.shared.data(product: product))
		} else {
			RemoveDataFromFirebase.shared.removeData(name: product.name)
		}
	}
	
	private func data(product: Product) -> [String: Any] {
		["cover": product.cover,
		 "typeCollection": product.typeCollection,
		 "productType": product.productType,
		 "name": product.name,
		 "price": product.price,
		 "sale": product.sale,
		 "numberStock": product.numberStock,
		 "numberOfProducts": product.numberOfProducts,
		 "numberOfReviews": product.productInformation.numberOfReviews,
		 "description": product.productInformation.description,
		 "thumbnails": parseThumbnails(product: product),
		 "colorPickers": parseColorPickers(product: product),
		 "specification": ["brand": product.productInformation.specification.brand,
						   "weight": product.productInformation.specification.weight,
						   "condition": product.productInformation.specification.condition,
						   "category": product.productInformation.specification.category,
						   "typeCloths": product.productInformation.specification.typeCloths],
		 "sizes": parseSizes(product: product)]
	}
	
	private func parseThumbnails(product: Product) -> [[String: Any]] {
		var thumbnails: [[String: Any]] = [[:]]
		
		product.productInformation.thumbnails.forEach { (image) in
			thumbnails.append(["image": image.image])
		}
		
		return thumbnails
	}
	
	private func parseColorPickers(product: Product) -> [[String: Any]] {
		var colorPickers: [[String: Any]] = [[:]]
		
		product.productInformation.colorPickers.forEach { (color) in
			colorPickers.append(["red": color.red, "green": color.green, "blue": color.blue])
		}
		
		return colorPickers
	}
	
	private func parseSizes(product: Product) -> [[String: Any]] {
		var sizes: [[String: Any]] = [[:]]
		
		product.productInformation.sizes.forEach { (size) in
			sizes.append(["size": size.size])
		}
		
		return sizes
	}
}


class GetWishlist: WorkWithFirebase {
	static let shared = GetWishlist()
	
	private override init() {}
	
	func getData() {
		databaseReference().child("wishlist_userID__\(getUserID())__").observe(.value, with: { (snapshot) in
			let data = snapshot.value as? [String: Any] ?? [:]
			data.forEach { (key, value) in
				print(value)
			}
		})
	}
}
