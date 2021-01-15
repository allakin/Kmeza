//
//  SideMenuPage.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 15.01.2021.
//

struct SideMenuPage {
	let pageName: String
	let pageImage: String

	static let page: [SideMenuPage] = [
		.init(pageName: "Home",
			  pageImage: "HomeNotPressed"),
		.init(pageName: "Featured",
			  pageImage: "FeaturedNotPressed"),
		.init(pageName: "My Cart",
			  pageImage: "MyCartNotPressed"),
		.init(pageName: "Wishlist",
			  pageImage: "WishlistNotPressed"),
		.init(pageName: "Logout",
			  pageImage: "LogoutNotPressed"),
	]
}
