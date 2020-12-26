//
//  ShowMainScreen.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 26.12.2020.
//

import UIKit

class ShowScreen {
	static let shared = ShowScreen()
	
	private init() {}
	
	func showMainScreen() {
		let mainScreen = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(identifier: "ViewController")
		if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
		   let sceneDelegate = windowScene.delegate as? SceneDelegate,
		   let window = sceneDelegate.window {
			window.rootViewController = mainScreen
		}
	}
}
