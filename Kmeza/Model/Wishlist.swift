//
//  Wishlist.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 24.04.2021.
//

import Foundation

var wishlists: [ProductInWishlist] = []

struct ProductInWishlist {
	let cover: String
	let typeCollection: String
	let productType: String
	let name: String
	let price: Double
	let sale: Double
	let numberStock: Int
	let numberOfProducts: Int
	let productInformation: InformationOfProductInWishlist
	
	init(value: [String: Any]) {
		self.cover = value["cover"] as? String ?? ""
		self.typeCollection = value["typeCollection"] as? String ?? ""
		self.productType = value["productType"] as? String ?? ""
		self.name = value["name"] as? String ?? ""
		self.price = value["price"] as? Double ?? 0.0
		self.sale = value["sale"] as? Double ?? 0.0
		self.numberStock = value["numberStock"] as? Int ?? 0
		self.numberOfProducts = value["numberOfProducts"] as? Int ?? 0
		self.productInformation = InformationOfProductInWishlist(value: value)
	}
}

struct InformationOfProductInWishlist {
	let thumbnails: [ThumbnailsInWishlist]
	let numberOfReviews: Int
	let description: String
	let colorPickers: [ColorPickerInWishlist]
	let	specification: SpecificationInWishlist
	let sizes: [SizeInWishlist]
	
	init(value: [String: Any]) {
		self.numberOfReviews = value["numberOfReviews"] as? Int ?? 0
		self.description = value["description"] as? String ?? ""
		self.specification =  SpecificationInWishlist(value: value["specification"] as! [String : Any])
		self.sizes = GetDataFromFirebase.shared.getSizes(value: value["sizes"] as! [Any])
		self.thumbnails = GetDataFromFirebase.shared.getThumbnails(value: value["thumbnails"] as! [Any])
		self.colorPickers = GetDataFromFirebase.shared.getcolorPickers(value:  value["colorPickers"] as! [Any])
	}
}

class GetDataFromFirebase {
	static let shared = GetDataFromFirebase()
	
	private init() {}
	
	func getSizes(value: [Any]) -> [SizeInWishlist] {
		var sizes: [SizeInWishlist] = []
	
		value.forEach { (sizeDic) in
			if let size = sizeDic as? [String: Any] {
				sizes.append(SizeInWishlist(value: size))
				
			}
		}
		
		return sizes
	}
	
	func getThumbnails(value: [Any]) -> [ThumbnailsInWishlist] {
		var thumbnails: [ThumbnailsInWishlist] = []
	
		value.forEach { (thumbnailsDic) in
			if let thumbnail = thumbnailsDic as? [String: Any] {
				thumbnails.append(ThumbnailsInWishlist(value: thumbnail))
				
			}
		}
		
		return thumbnails
	}
	
	func getcolorPickers(value: [Any]) -> [ColorPickerInWishlist] {
		var colorPickers: [ColorPickerInWishlist] = []
	
		value.forEach { (colorPickerDic) in
			if let colorPicker = colorPickerDic as? [String: Any] {
				colorPickers.append(ColorPickerInWishlist(value: colorPicker))
				
			}
		}
		
		return colorPickers
	}
}


struct SpecificationInWishlist {
	let brand: String
	let weight: String
	let condition: String
	let category: String
	let typeCloths: String
	
	init(value: [String: Any]) {
		self.brand = value["brand"] as? String ?? ""
		self.weight = value["weight"] as? String ?? ""
		self.condition = value["condition"] as? String ?? ""
		self.category = value["category"] as? String ?? ""
		self.typeCloths = value["typeCloths"] as? String ?? ""
	}
}

struct ColorPickerInWishlist {
	let red: Double
	let green: Double
	let blue: Double
	
	init(value: [String: Any]) {
		self.red = value["red"] as? Double ?? 0.0
		self.green = value["green"] as? Double ?? 0.0
		self.blue = value["blue"] as? Double ?? 0.0
	}
}

struct ThumbnailsInWishlist {
	let image: String
	
	init(value: [String: Any]) {
		self.image = value["image"] as? String ?? ""
	}
}

struct SizeInWishlist {
	var size: String
	
	init(value: [String: Any]) {
		self.size = value["size"] as? String ?? ""
	}
}

