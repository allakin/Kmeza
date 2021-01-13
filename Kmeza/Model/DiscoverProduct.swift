//
//  DiscoverProduct.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

struct DiscoverProduct {
	let image: String
	let title: String
	let price: Double
	let sale: Double
	
	static let discoverProducts: [DiscoverProduct] = [
		.init(image: "Walkthrough_Screen_1",
			  title: "1Denim Jacket",
			  price: 56,
			  sale: 60.00),
		.init(image: "Walkthrough_Screen_2",
			  title: "2Denim Jhins",
			  price: 123.46,
			  sale: 150.00),
		.init(image: "Walkthrough_Screen_3",
			  title: "3Denim Tishort",
			  price: 999.99,
			  sale: 1200.00),
		.init(image: "Walkthrough_Screen_1",
			  title: "4Denim Jacket",
			  price: 1523.46,
			  sale: 1600.00)
	]
}
