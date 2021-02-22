//
//  Product.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

struct Product {
	let cover: String
	let typeCollection: String
	let productType: String
	let title: String
	let price: Double
	let sale: Double
	let numberStock: Int
	let numberOfProducts: Int
	let productInformation: InformationOfProduct
	
	static let products: [Product] = [
		.init(cover: "Walkthrough_Screen_1",
			  typeCollection: "Man collections",
			  productType: "Discover",
			  title: "1Dis_Denim Jacket",
			  price: 56.00,
			  sale: 60.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_1"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_1"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_3")],
													   numberOfReviews: 234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Shoes"))), //"Discover"
		.init(cover: "Walkthrough_Screen_1",
			  typeCollection: "Man collections",
			  productType: "Discover",
			  title: "2Dis_Denim Jacket",
			  price: 56.00,
			  sale: 60.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2")],
													   numberOfReviews: 234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Suits"))), //"Discover"
		.init(cover: "Walkthrough_Screen_1",
			  typeCollection: "Man collections",
			  productType: "Discover",
			  title: "3Dis_Denim Jacket",
			  price: 56.00,
			  sale: 60.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2")],
													   numberOfReviews: 234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Dress"))), //"Discover"
		.init(cover: "Walkthrough_Screen_1",
			  typeCollection: "Man collections",
			  productType: "Discover",
			  title: "4Dis_Denim Jacket",
			  price: 56.00,
			  sale: 60.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2")],
													   numberOfReviews: 234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Dress"))), //"Discover"
		.init(cover: "Walkthrough_Screen_1",
			  typeCollection: "Man collections",
			  productType: "Discover",
			  title: "5Dis_1Denim Jacket",
			  price: 56.00,
			  sale: 60.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2")],
													   numberOfReviews: 234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Dress"))), //"Discover"
		.init(cover: "Walkthrough_Screen_2",
			  typeCollection: "Woman collections",
			  productType: "Flash Sale",
			  title: "1FS_Denim Jhins",
			  price: 123.46,
			  sale: 150.00,
			  numberStock: 200,
			  numberOfProducts: 100,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3")],
													   numberOfReviews: 4512,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Suits"))), //"Flash Sale"
		.init(cover: "Walkthrough_Screen_2",
			  typeCollection: "Woman collections",
			  productType: "Flash Sale",
			  title: "2Denim Jhins",
			  price: 123.46,
			  sale: 150.00,
			  numberStock: 200,
			  numberOfProducts: 100,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3")],
													   numberOfReviews: 4512,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Suits"))), //"Flash Sale"
		.init(cover: "Walkthrough_Screen_2",
			  typeCollection: "Woman collections",
			  productType: "Flash Sale",
			  title: "2Denim Jhins",
			  price: 123.46,
			  sale: 150.00,
			  numberStock: 200,
			  numberOfProducts: 115,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_1"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_1")],
													   numberOfReviews: 4512,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Dress"))), //"Flash Sale"
		.init(cover: "Walkthrough_Screen_2",
			  typeCollection: "Woman collections",
			  productType: "Flash Sale",
			  title: "2Denim Jhins",
			  price: 123.46,
			  sale: 150.00,
			  numberStock: 200,
			  numberOfProducts: 120,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3")],
													   numberOfReviews: 4512,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Suits"))), //"Flash Sale"
		.init(cover: "Walkthrough_Screen_2",
			  typeCollection: "Woman collections",
			  productType: "Flash Sale",
			  title: "2Denim Jhins",
			  price: 123.46,
			  sale: 150.00,
			  numberStock: 200,
			  numberOfProducts: 1,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3")],
													   numberOfReviews: 4512,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Suits"))), //"Flash Sale"
		.init(cover: "Walkthrough_Screen_2",
			  typeCollection: "Woman collections",
			  productType: "Flash Sale",
			  title: "2Denim Jhins",
			  price: 123.46,
			  sale: 150.00,
			  numberStock: 200,
			  numberOfProducts: 200,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3")],
													   numberOfReviews: 4512,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Suits"))), //"Flash Sale"
		.init(cover: "Walkthrough_Screen_2",
			  typeCollection: "Woman collections",
			  productType: "Flash Sale",
			  title: "7FS_Denim Jhins",
			  price: 123.46,
			  sale: 150.00,
			  numberStock: 200,
			  numberOfProducts: 200,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3"),
																	   ProductImage(image: "Walkthrough_Screen_3")],
													   numberOfReviews: 4512,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Suits"))), //"Flash Sale"
		.init(cover: "Walkthrough_Screen_3",
			  typeCollection: "Woman collections",
			  productType: "Newest Products",
			  title: "1Ne_Denim Tishort",
			  price: 800.99,
			  sale: 1200.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_1"),
																	   ProductImage(image: "Walkthrough_Screen_1"),
																	   ProductImage(image: "Walkthrough_Screen_1"),
																	   ProductImage(image: "Walkthrough_Screen_1"),
																	   ProductImage(image: "Walkthrough_Screen_1"),
																	   ProductImage(image: "Walkthrough_Screen_1")],
													   numberOfReviews: 1234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Shoes"))), //"Newest Products"
		.init(cover: "Walkthrough_Screen_1",
			  typeCollection: "Woman collections",
			  productType: "Newest Products",
			  title: "4Denim Jacket",
			  price: 1523.46,
			  sale: 1600.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2")],
													   numberOfReviews: 234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Shoes"))), //"Newest Products"
		.init(cover: "Walkthrough_Screen_1",
			  typeCollection: "Woman collections",
			  productType: "Newest Products",
			  title: "4Denim Jacket",
			  price: 1523.46,
			  sale: 1600.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2")],
													   numberOfReviews: 234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Shoes"))), //"Newest Products"
		.init(cover: "Walkthrough_Screen_1",
			  typeCollection: "Woman collections",
			  productType: "Newest Products",
			  title: "4Denim Jacket",
			  price: 1523.46,
			  sale: 1600.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2")],
													   numberOfReviews: 234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Dress"))), //"Newest Products"
		.init(cover: "Walkthrough_Screen_1",
			  typeCollection: "Woman collections",
			  productType: "Newest Products",
			  title: "5Ne_Denim Jacket",
			  price: 1523.46,
			  sale: 1600.00,
			  numberStock: 123,
			  numberOfProducts: 0,
			  productInformation: InformationOfProduct(productImages: [ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2"),
																	   ProductImage(image: "Walkthrough_Screen_2")],
													   numberOfReviews: 234,
													   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
													   color: [ProductColor(red: 0.92,
																			green: 0.20,
																			blue: 0.14),
															   ProductColor(red: 0.46,
																			green: 0.98,
																			blue: 0.30),
															   ProductColor(red: 1.00,
																			green: 0.60,
																			blue: 0.49),
															   ProductColor(red: 1.00,
																			green: 1.00,
																			blue: 0.33),
															   ProductColor(red: 0.31,
																			green: 0.32,
																			blue: 0.33)],
													   specification: Specification(brand: "Naiki Shoes",
																					weight: "260gr",
																					condition: "NEW",
																					category: "Men Cloths",
																					typeCloths: "Dress")))  //"Newest Products"
	]
	
	static func sortFetchData(by type: ProductType) -> [Product] {
		var products: [Product] = []
		
		Product.products.forEach { (product) in
			if product.productType == type.rawValue {
				let product = Product(cover: product.cover,
									  typeCollection: product.typeCollection,
									  productType: product.productType,
									  title: product.title,
									  price: product.price,
									  sale: product.sale,
									  numberStock: product.numberStock,
									  numberOfProducts: product.numberOfProducts,
									  productInformation: product.productInformation)
				products.append(product)
			}
		}
		
		return products
	}
}


enum ProductType: String {
	case discover = "Discover"
	case flashSale = "Flash Sale"
	case newestProducts = "Newest Products"
}
