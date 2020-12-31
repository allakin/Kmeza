//
//  WelcomeFeatureCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 29.12.2020.
//

import UIKit

class WelcomeFeatureCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var welcomePageController: UIPageControl!
	
	func configureContant(with info: WelcomeFeature) {
		titleLabel.text = info.title
		descriptionLabel.text = info.description
		welcomePageController.numberOfPages = WelcomeFeature.collection.count
	}
}
