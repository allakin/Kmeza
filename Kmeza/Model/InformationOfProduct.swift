//
//  InformationOfProduct.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 13.01.2021.
//

struct InformationOfProduct {
	let thumbnails: [ProductImage]
	let numberOfReviews: Int
	let description: String
	let colorPickers: [ColorPicker]
	let	specification: Specification
	let sizes: [Size]
}

struct Specification {
	let brand: String
	let weight: String
	let condition: String
	let category: String
	let typeCloths: String
}

struct ColorPicker {
	let red: Double
	let green: Double
	let blue: Double
}

struct ProductImage {
	let image: String
}

struct Size {
	let size: String
}
