//
//  FlashSaleProduct.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

struct FlashSaleProduct {
	let image: String
	let title: String
	let typeCollection: String
	let price: Double
	let numberStock: Int
	
	static let flashSaleProducts: [FlashSaleProduct] = [
		.init(image: "Walkthrough_Screen_1",
			  title: "1Mosshi Red Bag",
			  typeCollection: "MAN COLLECTIONS",
			  price: 35.62,
			  numberStock: 150),
		.init(image: "Walkthrough_Screen_2",
			  title: "2White Hat",
			  typeCollection: "WOMAN COLLECTIONS",
			  price: 23.12,
			  numberStock: 34),
		.init(image: "Walkthrough_Screen_3",
			  title: "3Mosshi Red Bag",
			  typeCollection: "MAN COLLECTIONS",
			  price: 12.62,
			  numberStock: 134),
		.init(image: "Walkthrough_Screen_2",
			  title: "4White Hat",
			  typeCollection: "WOMAN COLLECTIONS",
			  price: 12.15,
			  numberStock: 34),
		.init(image: "Walkthrough_Screen_1",
			  title: "5Hand Watch",
			  typeCollection: "MAN COLLECTIONS",
			  price: 11.00,
			  numberStock: 99),
		.init(image: "Walkthrough_Screen_2",
			  title: "6White Hat",
			  typeCollection: "WOMAN COLLECTIONS",
			  price: 19.62,
			  numberStock: 5),
		.init(image: "Walkthrough_Screen_1",
			  title: "7Hand Watch",
			  typeCollection: "MAN COLLECTIONS",
			  price: 27.23,
			  numberStock: 35),
		.init(image: "Walkthrough_Screen_1",
			  title: "8Hand Watch",
			  typeCollection: "MAN COLLECTIONS",
			  price: 27.23,
			  numberStock: 35),
		.init(image: "Walkthrough_Screen_1",
			  title: "9Hand Watch",
			  typeCollection: "MAN COLLECTIONS",
			  price: 27.23,
			  numberStock: 35),
		.init(image: "Walkthrough_Screen_1",
			  title: "10Hand Watch",
			  typeCollection: "WOMAN COLLECTIONS",
			  price: 27.23,
			  numberStock: 35)
	]
}
