//
//  Extension+Image.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

import UIKit

extension UIImageView {
	
	func setImageShadow() {
		getImageView().layer.shadowColor = UIColor.getColor(color: .primaryAccentColor).cgColor
		getImageView().layer.shadowOffset = CGSize(width: 0, height: 9)
		getImageView().layer.shadowOpacity = 0.28
		getImageView().layer.shadowRadius = 24
		getImageView().layer.masksToBounds = false
	}
	
	private func getImageView() -> UIImageView {
		self
	}
}
