//
//  Catalog.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 09.03.2021.
//

import Foundation

struct Catalog {
	let image: String
	let title: String
	
	static let categories: [Catalog] = [
		.init(image: "Walkthrough_Screen_1", title: "men".uppercased()),
		.init(image: "Walkthrough_Screen_2", title: "womanmen".uppercased()),
		.init(image: "Walkthrough_Screen_3", title: "children".uppercased())
	]
}
