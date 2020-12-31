//
//  ShowMainScreen.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 26.12.2020.
//

import UIKit

class ShowWelcomeScreen {
	static let shared = ShowWelcomeScreen()
	
	private init() {}
	
	func showWelcomeScreen() {
		let mainScreen = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(identifier: "WelcomeViewController")
		if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
		   let sceneDelegate = windowScene.delegate as? SceneDelegate,
		   let window = sceneDelegate.window {
			window.rootViewController = mainScreen
		}
	}
}
