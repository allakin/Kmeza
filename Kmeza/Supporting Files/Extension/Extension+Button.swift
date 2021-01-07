//
//  Shadow.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 20.12.2020.
//

import UIKit

extension UIButton {
	func setButtonShadow() {
		getButton().layer.shadowColor = UIColor.getColor(color: .primaryAccentColor).cgColor
		getButton().layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
		getButton().layer.shadowOpacity = 0.8
		getButton().layer.shadowRadius = 10.0
		getButton().layer.masksToBounds = false
	}
	
	func settingButton(image: String) {
		setFullRoundCorners()
		getButton().setImage(UIImage(named: image), for: .normal)
		getButton().tintColor = .white
	}
	
	func addActivityIndicatorInsideButton(at view: UIView) {
		AddActivityIndicator.shared.showActivityIndicator(on: view, and: getButton())
	}
	
	func changeAlphaChanel() {
		getButton().alpha = 0.2
	}
	
	func addBorderButton() {
		getButton().layer.borderWidth = 1
		getButton().layer.borderColor = UIColor.getColor(color: .primaryAccentColor).cgColor
		getButton().tintColor = .getColor(color: .primaryAccentColor)
	}
	
	func setFullRoundCorners() {
		getButton().layer.cornerRadius = getButton().frame.size.height / 2
	}
	
	func setLeftPositionIconInsideButton(at number: CGFloat) {
		getButton().imageEdgeInsets.right = number
	}
	
	private func getButton() -> UIButton {
		self
	}
}
