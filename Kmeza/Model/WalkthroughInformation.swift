//
//  WalkthroughInformation.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 19.12.2020.
//

struct WalkthroughInformation {
	let image: String
	let title: String
	let description: String
	
	static let collection: [WalkthroughInformation] = [
		.init(image: "Walkthrough_Screen_1",
			  title: "Find Your Outfits",
			  description: "Confused about your outfit? Don't worry! Find the best outfit here."),
		.init(image: "Walkthrough_Screen_2",
			  title: "Your style, your way",
			  description: "Confused about your outfit? Don't worry! Find the best outfit here."),
		.init(image: "Walkthrough_Screen_3",
			  title: "Hear if first, wear it first",
			  description: "Confused about your outfit? Don't worry! Find the best outfit here.")
	]
}
