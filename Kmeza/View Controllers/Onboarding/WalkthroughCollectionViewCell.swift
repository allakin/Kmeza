//
//  WalkthroughCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 19.12.2020.
//

import UIKit

class WalkthroughCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var lastButton: UIButton!
	@IBOutlet weak var nextButton: UIButton!
	@IBOutlet weak var walkthroughPageController: UIPageControl!
	
	var actionButtonDidTap: ( () -> Void )?
	
	func configureContant(with info: WalkthroughInformation) {
		configureButton()
		mainImage.image = UIImage(named: info.image)
		titleLabel.text = info.title
		descriptionLabel.text = info.description
		walkthroughPageController.numberOfPages = WalkthroughInformation.collection.count
	}
	
	func changeNextButtonBGColor(number: Int) {
		if walkthroughPageController.currentPage == number {
			nextButton.backgroundColor = UIColor(named: "Primary Accent Color")
		}
	}
	
	private func configureButton() {
		//		lastButton.settingButton(button: lastButton, with: "lastButtonIcon")
		//		lastButton.setShadow(button: lastButton)
		
		nextButton.settingButton(button: nextButton, with: "nextButtonIcon")
		nextButton.setShadow(button: nextButton)
	}
	
	@IBAction func lastButtonPressed() {
		print("last")
		actionButtonDidTap?()
	}
	
	@IBAction func nextButtonPressed() {
		print("next")
		actionButtonDidTap?()
	}
}
