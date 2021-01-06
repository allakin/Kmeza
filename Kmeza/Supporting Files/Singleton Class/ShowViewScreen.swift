//
//  ShowViewScreen.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 26.12.2020.
//

import UIKit

class ShowViewScreen {
	static let shared = ShowViewScreen()
	
	private init() {}
	
	func showWelcomeScreen() {
		setRootViewController(identifier: "WelcomeViewController")
	}
	
	func showHomeScreen() {
		setRootViewController(identifier: "HomeScreenViewController")
	}
	
	private func setRootViewController(identifier: String) {
		let mainScreen = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(identifier: identifier)
		if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
		   let sceneDelegate = windowScene.delegate as? SceneDelegate,
		   let window = sceneDelegate.window {
			window.rootViewController = mainScreen
		}
	}
}
