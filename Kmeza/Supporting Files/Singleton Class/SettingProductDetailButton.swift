//
//  SettingProductDetailButton.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 22.02.2021.
//

import UIKit

class SettingProductDetailButton {
	static let shared = SettingProductDetailButton()
	
	private init() {}
	
	func setSelectedSize(at button: [UIButton], and tag: Int) {
		for (index, value) in button.enumerated() {
			if index == tag {
				value.backgroundColor = UIColor.getColor(color: .primaryAccentColor)
			} else {
				value.backgroundColor = .clear
			}
		}
	}
	
	func setSelectedColor(at button: [UIButton], and tag: Int) {
		for (index, value) in button.enumerated() {
			if index == tag {
				value.layer.borderWidth = 2
				value.layer.borderColor = UIColor.getColor(color: .primaryAccentColor).cgColor
			} else {
				value.layer.borderWidth = 0
			}
		}
	}
	
	func setDisabledState(at button: UIButton, and price: UILabel) {
		if price.text == "SOLD" {
			button.isSelected = false
			button.backgroundColor = .lightGray
			button.titleColor(for: .disabled)
		}
	}
	
	func hideLabel(at label: UILabel, and price: UILabel) {
		if price.text == "SOLD" {
			label.isHidden = true
		}
	}
}
