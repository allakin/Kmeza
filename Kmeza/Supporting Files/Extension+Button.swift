//
//  Shadow.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 20.12.2020.
//

import UIKit

extension UIButton {
	func setButtonShadow() {
		getButton().layer.shadowColor = UIColor(named: "Primary Accent Color")?.cgColor
		getButton().layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
		getButton().layer.shadowOpacity = 0.8
		getButton().layer.shadowRadius = 10.0
		getButton().layer.masksToBounds = false
	}
	
	func settingButton(image: String) {
		getButton().layer.cornerRadius = getButton().frame.size.height / 2
		getButton().setImage(UIImage(named: image), for: .normal)
		getButton().tintColor = .white
	}
	
	func setLeftPositionIconInsideButton(at number: CGFloat) {
		getButton().imageEdgeInsets.right = number
	}
	
	private func getButton() -> UIButton {
		self
	}
}
