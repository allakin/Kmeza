//
//  Extension+String.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 04.01.2021.
//

import Foundation

extension String {
	func isValidText(_ validdityType: ValidityType) -> Bool {
		let format = "SELF MATCHES %@"
		
		switch validdityType {
		case .email:
			return NSPredicate(format: format, Regex.email.rawValue).evaluate(with: self)
		default:
			return NSPredicate(format: format, Regex.password.rawValue).evaluate(with: self)
		}
	}
}

enum ValidityType {
	case email
	case password
}

enum Regex: String {
	case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	case password = "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{8,}$"
	//Minimum 8 characters at least 1 Alphabet and 1 Number and 1 special character
}
