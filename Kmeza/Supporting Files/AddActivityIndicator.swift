//
//  Extension+UIActifityIndicatoreView.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 01.01.2021.
//

import UIKit

class AddActivityIndicator {
	static let shared = AddActivityIndicator()
	
	private let spinner = UIActivityIndicatorView(style: .medium)
	
	private init() {}
	
	func startActivityIndicator() {
		spinner.startAnimating()
	}
	
	func stopActivityIndicator() {
		spinner.stopAnimating()
	}
	
	func showActivityIndicator(on view: UIView, and button: UIButton) {
		view.addSubview(getActivitiIndicator())
		setPositionActivityIndicator(inside: button)
	}
	
	private func setPositionActivityIndicator(inside button: UIButton) {
		getActivitiIndicator().centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
		getActivitiIndicator().centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
	}
	
	private func getActivitiIndicator() -> UIActivityIndicatorView {
		spinner.translatesAutoresizingMaskIntoConstraints = false
		spinner.color = UIColor.getColor(color: .primaryAccentColor)
		spinner.hidesWhenStopped = true
		return spinner
	}
}
