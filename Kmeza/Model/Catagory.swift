//
//  Catagory.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 31.01.2021.
//

struct Category {
	let title: String
	let countlOfProduct: Int
	let image: String
	let height: Int
	let width: Int
	
	static let categories: [Category] = [
		.init(title: "Men Shoes", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Women Shoes", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Dress", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Men Suits", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Men Shoes", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Young Collections", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Men Shoes", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Young Collections", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Men Shoes", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Young Collections", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Women Shoes", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber()),
		.init(title: "Women Shoes", countlOfProduct: 123, image: "", height: getRandomNumber(), width: getRandomNumber())
	]
}


func getRandomNumber() -> Int {
	Int.random(in: 250..<500)
}
