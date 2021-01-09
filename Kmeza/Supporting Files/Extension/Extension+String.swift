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
	
	func isValidEmailAddress() -> Bool {
		let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
			+ "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
			+ "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
			+ "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
			+ "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
			+ "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
			+ "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
		
//		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		
		let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
		return emailTest.evaluate(with: self)
	}
	
	func isValidPassword() -> Bool {
		let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{8,}$"
		
		let passwordTest = NSPredicate(format:"SELF MATCHES[c] %@", passwordRegEx)
		return passwordTest.evaluate(with: self)
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
