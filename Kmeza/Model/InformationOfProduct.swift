//
//  InformationOfProduct.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 13.01.2021.
//

struct InformationOfProduct {
	let productImages: [ProductImage]
	let numberOfReviews: Int
	let description: String
	let color: [ProductColor]
	let	specification: Specification
}

struct Specification {
	let brand: String
	let weight: String
	let condition: String
	let category: String
	let typeCloths: String
}

struct ProductColor {
	let red: Double
	let green: Double
	let blue: Double
}

struct ProductImage {
	let image: String
}
