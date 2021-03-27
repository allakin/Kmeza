//
//  Extension+UINavigationController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 27.03.2021.
//

import UIKit

extension UINavigationController {
	func settingUI() {
		getNavigation().navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		getNavigation().navigationBar.shadowImage = UIImage()
		getNavigation().navigationBar.isTranslucent = true
		getNavigation().navigationBar.tintColor = UIColor(red:0.73, green:0.74, blue:0.83, alpha:1.00)
	}
	
	private func getNavigation() -> UINavigationController {
		self
	}
}
