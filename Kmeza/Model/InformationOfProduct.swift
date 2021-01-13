//
//  InformationOfProduct.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 13.01.2021.
//

struct InformationOfProduct {
	let size: String
	let description: String
	let color: [productColor]
	let	specification: Specification
}

struct Specification {
	let brand: String
	let weight: String
	let condition: String
	let category: String
}

struct productColor {
	let red: Int
	let green: Int
	let blue: Int
}
