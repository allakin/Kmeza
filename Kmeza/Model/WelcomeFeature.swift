//
//  WelcomeFeature.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 29.12.2020.
//

struct WelcomeFeature {
	let title: String
	let description: String
	
	static let collection: [WelcomeFeature] = [
		.init(title: "Find Your Outfits",
			  description: "Confused about your outfit? Don't worry! Find the best outfit here."),
		.init(title: "Your style, your way",
			  description: "Confused about your outfit? Don't worry! Find the best outfit here."),
		.init(title: "Hear if first, wear it first",
			  description: "Confused about your outfit? Don't worry! Find the best outfit here.")
	]
}
