//
//  Extension+UIlabel.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 17.01.2021.
//

import UIKit

extension UILabel {
	
	func addAttributeString() {
		let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "Your Text")
			attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
		getLabel().attributedText = attributeString
	}
	
	func getLabel() -> UILabel {
		self
	}
	
}
