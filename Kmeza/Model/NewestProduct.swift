//
//  NewestProduct.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 11.01.2021.
//

struct NewestProduct {
	let image: String
	let title: String
	let price: Double
	let sale: Double
	let numberOfReviews: Int
	
	static let newestProducts: [NewestProduct] = [
		.init(image: "Walkthrough_Screen_1",
			  title: "Naiki White Pro Sneakers",
			  price: 24.56,
			  sale: 30.0,
			  numberOfReviews: 245),
		.init(image: "Walkthrough_Screen_2",
			  title: "Long Grey Bomber Jackets",
			  price: 158.2,
			  sale: 170,
			  numberOfReviews: 245),
		.init(image: "Walkthrough_Screen_3",
			  title: "Blue Denim Cassual Jackets",
			  price: 87.45,
			  sale: 90.0,
			  numberOfReviews: 245),
		.init(image: "Walkthrough_Screen_1",
			  title: "Black Leather Jackets for Men",
			  price: 1512.21,
			  sale: 170,
			  numberOfReviews: 245),
		.init(image: "Walkthrough_Screen_2",
			  title: "Black Leather Jackets for Men",
			  price: 158.2,
			  sale: 170,
			  numberOfReviews: 245)
	]
}
