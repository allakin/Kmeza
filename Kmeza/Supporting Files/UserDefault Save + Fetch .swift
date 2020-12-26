//
//  UserDefault Save + Fetch .swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 23.12.2020.
//

import Foundation

class GetUserDefaults {
	static let userDefault = UserDefaults.standard
}

class SaveDataInUserDefaults: GetUserDefaults {
	static func saveData(state: Bool, key: String) {
		userDefault.setValue(state, forKey: key)
	}
}

class FetchDataFromUserDefaults: GetUserDefaults {
	static func fetchData(with key: String) -> Bool {
		userDefault.bool(forKey: key)
	}
}
