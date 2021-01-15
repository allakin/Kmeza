//
//  AuthorizationInFirebase.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 08.01.2021.
//	

import FirebaseAuth

class SignIn {
	static let shared = SignIn()
	
	private init() {}
	
	func signIn(email: String, password: String) {
		Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
			guard self != nil else { return }
			
			if let error = error {
				print(error.localizedDescription)
				return
			}
			
			SetRootViewController.saveCurrentScreen(currentScreen: .homeScreenViewController)
			ShowViewScreen.shared.showHomeScreen()
			
		}
	}
}

class SignUp {
	static let shared = SignUp()
	
	private init() {}
	
	func createUser(email: String, password: String) {
		Auth.auth().createUser(withEmail: email, password: password) { [weak self] results, error in
			guard self != nil else { return }
			
			if let error = error {
				print(error.localizedDescription)
				return
			}
			
			SetRootViewController.saveCurrentScreen(currentScreen: .homeScreenViewController)
			ShowViewScreen.shared.showHomeScreen()
			
		}
	}
}

class GetUserInformation {
	static let shared = GetUserInformation()
	
	private init() {}
	
	func getUserEmail() -> String {
		Auth.auth().currentUser?.email ?? "Unknown email"
	}
	
	func getUserName() -> String {
		Auth.auth().currentUser?.displayName ?? "Unknown name"
	}
}
