//
//  TextFieldWithPadding.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 01.01.2021.
//

import UIKit

class TextFieldWithPadding: UITextField {
	var textInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24) {
		didSet {
			setNeedsDisplay()
		}
	}
	
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: textInsets)
	}
	
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: textInsets)
	}
	
	override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.inset(by: textInsets)
	}
}
