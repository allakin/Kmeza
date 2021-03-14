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
	let nextPage: String
	let previewsPage: String
	
	static let categories: [Catalog] = [
		.init(image: "1", title: "Men Collection".uppercased(), nextPage: "For woman →", previewsPage: ""),
		.init(image: "2", title: "Woman Collection".uppercased(), nextPage: "For children →", previewsPage: "← For men"),
		.init(image: "3", title: "Children Collection".uppercased(), nextPage: "", previewsPage: "← For woman"),
	]
}
