//
//  Extension+Color.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 01.01.2021.
//

import UIKit

extension UIColor {
	enum ColorName {
		case primaryAccentColor
		case secondaryAccentColor
		case thirdAccentColor
		case lightAccentBackgroundColor
		case primaryBackgroundColor
		case secondaryBackgroundColor
		case raitingColor
		case canceledMarkBackgroundColor
		case canceledMarkTextColor
		case completedMarkBackgroundColor
		case completedMarkTextColor
		case onDeliveryMarkBackgroundColor
		case onDeliveryMarkTextColor
		case textFileldBackroundDefaultColor
		case textFileldBorderDefaultColor
		case navigationButtonColor
	}
	
	static func getColor(color: ColorName) -> UIColor {
		switch color {
		case .primaryAccentColor:
			return UIColor(named: "primaryAccentColor") ?? .red
		case .secondaryAccentColor:
			return UIColor(named: "secondaryAccentColor") ?? .red
		case .thirdAccentColor:
			return UIColor(named: "thirdAccentColor") ?? .red
		case .lightAccentBackgroundColor:
			return UIColor(named: "lightAccentBackgroundColor") ?? .red
		case .primaryBackgroundColor:
			return UIColor(named: "primaryBackgroundColor") ?? .red
		case .secondaryBackgroundColor:
			return UIColor(named: "secondaryBackgroundColor") ?? .red
		case .raitingColor:
			return UIColor(named: "raitingColor") ?? .red
		case .canceledMarkBackgroundColor:
			return UIColor(named: "canceledMarkBackgroundColor") ?? .red
		case .canceledMarkTextColor:
			return UIColor(named: "canceledMarkTextColor") ?? .red
		case .completedMarkBackgroundColor:
			return UIColor(named: "completedMarkBackgroundColor") ?? .red
		case .completedMarkTextColor:
			return UIColor(named: "completedMarkTextColor") ?? .red
		case .onDeliveryMarkBackgroundColor:
			return UIColor(named: "onDeliveryMarkBackgroundColor") ?? .red
		case .onDeliveryMarkTextColor:
			return UIColor(named: "onDeliveryMarkTextColor") ?? .red
		case .textFileldBackroundDefaultColor:
			return UIColor(named: "textFileldBackroundDefaultColor") ?? .red
		case .textFileldBorderDefaultColor:
			return UIColor(named: "textFileldBorderDefaultColor") ?? .red
		case .navigationButtonColor:
			return UIColor(named: "navigationButtonColor") ?? .red
		}
	}
}
