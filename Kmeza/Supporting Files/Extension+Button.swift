//
//  Shadow.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 20.12.2020.
//

import UIKit

extension UIButton {
	func setShadow() {
		let button = self
		button.layer.shadowColor = UIColor(named: "Primary Accent Color")?.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
		button.layer.shadowOpacity = 0.8
		button.layer.shadowRadius = 10.0
		button.layer.masksToBounds = false
	}
	
	func settingButton(image: String) {
		let button = self
		button.layer.cornerRadius = button.frame.size.height / 2
		button.setImage(UIImage(named: image), for: .normal)
		button.tintColor = .white
	}
	
	func settingWelcomeButton(image: String) {
		let button = self
		button.setImage(UIImage(named: image), for: .normal)
		button.tintColor = .white
		button.layer.cornerRadius = button.frame.size.height / 2
	}
}
