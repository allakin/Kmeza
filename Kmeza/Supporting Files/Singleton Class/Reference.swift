//
//  Reference.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 08.01.2021.
//

import Firebase

class Reference {
	static let shared = Reference()
	
	private init() {}
	
	func correctReference() -> DatabaseReference {
		Database.database().reference()
	}
	
	func returnUserID() -> String {
		if let userID = Auth.auth().currentUser?.uid {
			return userID
		} else {
			return ""
		}
	}
	
}
