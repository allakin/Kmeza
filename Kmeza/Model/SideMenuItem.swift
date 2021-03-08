//
//  SideMenuItem.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 15.01.2021.
//

struct SideMenuItem {
	let pageName: String
	let pageImage: String

	static let items: [SideMenuItem] = [
		.init(pageName: "Home",
			  pageImage: "HomeNotPressed"),
		.init(pageName: "Catalog",
			  pageImage: "CatalogNotPressed"),
		.init(pageName: "My Cart",
			  pageImage: "MyCartNotPressed"),
		.init(pageName: "Wishlist",
			  pageImage: "WishlistNotPressed"),
		.init(pageName: "Logout",
			  pageImage: "LogoutNotPressed"),
	]
}
