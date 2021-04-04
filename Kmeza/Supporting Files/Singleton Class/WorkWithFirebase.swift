//
//  WorkWithFirebase.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 03.04.2021.
//

import Firebase

class WorkWithFirebase {
	func databaseReference() -> DatabaseReference {
		Database.database().reference()
	}
	
	func getUserID() -> String {
		guard let userID = Auth.auth().currentUser?.uid else { return "" }
		return userID
	}
	
	func getKeyID() -> String? {
		databaseReference().childByAutoId().key
	}
	
	func getKeyFromStore(key: StoreKey) -> String {
		switch key {
		case .labelArticle:
			return "labelArticle"
		case .keyID:
			return "keyID"
		}
	}
}

enum StoreKey {
	case labelArticle
	case keyID
}

class SaveDataInFirebase: WorkWithFirebase {
	static let shared = SaveDataInFirebase()
	
	private override init() {}
	
	func saveData(data: [String: Any]) {
		guard let name = data["name"] as? String else { return }
		databaseReference().child("wishlist_userID\(getUserID())").child(name).setValue(data)
	}
}

class RemoveDataFromFirebase: WorkWithFirebase {
	static let shared = RemoveDataFromFirebase()
	
	private override init() {}
	
	func removeData(name: String) {
		databaseReference().child("wishlist_userID\(getUserID())").child(name).removeValue()
	}
}
