//
//  WelcomeViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 19.12.2020.
//

import UIKit
import AuthenticationServices
import FirebaseAuth

class WelcomeViewController: UIViewController {
	
	@IBOutlet weak var loginWithEmailButton: UIButton!
	@IBOutlet weak var loginWithAppleIDButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		settingUI()
	}
	
	@IBAction func AppleIDLoginAction(_ sender: Any) {
		getPerformRequests()
	}
	
	private func getPerformRequests() {
		let request = SignWithAppleID.shared.createAppleIDRequest()
		let autorizationController = ASAuthorizationController(authorizationRequests: [request])
		
		autorizationController.delegate = self
		autorizationController.presentationContextProvider = self
		
		autorizationController.performRequests()
	}
	
	private func settingUI() {
		loginWithAppleIDButton.settingButton(image: "Apple")
		loginWithAppleIDButton.setLeftPositionIconInsideButton(at: 20)
		
		loginWithEmailButton.settingButton(image: "Email")
		loginWithEmailButton.setLeftPositionIconInsideButton(at: 20)
	}
}

//MARK: - ASAuthorizationControllerDelegate
extension WelcomeViewController: ASAuthorizationControllerDelegate {
	func authorizationController(controller: ASAuthorizationController,
								 didCompleteWithAuthorization authorization: ASAuthorization) {
		SignWithAppleID.shared.userAuth(authorization: authorization)
	}
}

//MARK: - ASAuthorizationControllerPresentationContextProviding
extension WelcomeViewController: ASAuthorizationControllerPresentationContextProviding {
	func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
		view.window!
	}
}
