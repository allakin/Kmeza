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

class SetRootViewController: GetUserDefaults {
	static func saveCurrentScreen(currentScreen: StoryBoardID) {
		userDefault.setValue(currentScreen.rawValue, forKey: CURRENT_ROOT_VIEW_CONTROLLER)
	}
}

class FetchRootViewController: GetUserDefaults {
	static func fetchData() -> String {
		guard let fetchData = userDefault.string(forKey: CURRENT_ROOT_VIEW_CONTROLLER) else { return "" }
		return fetchData
	}
}

enum StoryBoardID: String {
	case welcomeViewController = "WelcomeViewController"
	case homeScreenViewController = "HomeScreenViewController"
}
