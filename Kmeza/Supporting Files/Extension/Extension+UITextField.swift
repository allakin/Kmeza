//
//  Extension+UITextField.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 01.01.2021.
//

import UIKit

extension UITextField {
	func defaultStateTextField() {
		settingTextField(width: 1)
		getTextField().layer.borderColor = UIColor.getColor(color: .textFileldBorderDefaultColor).cgColor
		getTextField().backgroundColor = .getColor(color: .textFileldBackroundDefaultColor)
	}
	
	func fillingStateTextField() {
		settingTextField(width: 2)
		getTextField().layer.borderColor = UIColor.getColor(color: .primaryAccentColor).cgColor
		getTextField().backgroundColor = .getColor(color: .textFileldBackroundDefaultColor)
	}
	
	func errorStateTextField() {
		settingTextField(width: 2)
		getTextField().layer.borderColor = UIColor.getColor(color: .canceledMarkTextColor).cgColor
		getTextField().backgroundColor = .getColor(color: .textFileldBackroundDefaultColor)
	}
	
	func filledStateTextField() {
		settingTextField(width: 2)
		getTextField().layer.borderColor = UIColor.getColor(color: .completedMarkTextColor).cgColor
		getTextField().backgroundColor = .getColor(color: .textFileldBackroundDefaultColor)
	}
	
	private func settingTextField(width: CGFloat) {
		getTextField().layer.cornerRadius =  getTextField().frame.size.height / 2
		getTextField().layer.borderWidth = width
		getTextField().layer.masksToBounds = true
	}
	
	private func getTextField() -> UITextField {
		self
	}
}
