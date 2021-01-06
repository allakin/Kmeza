//
//  SignWithAppleID.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 06.01.2021.
//

import AuthenticationServices
import CryptoKit
import FirebaseAuth

class SignWithAppleID {
	static let shared = SignWithAppleID()
	
	fileprivate var currentNonce: String?
	
	private init() {}
	
	func createAppleIDRequest() -> ASAuthorizationAppleIDRequest {
		let appleIDProvider = ASAuthorizationAppleIDProvider()
		let request = appleIDProvider.createRequest()
		request.requestedScopes = [.fullName, .email]
		
		let nonce = randomNonceString()
		request.nonce = sha256(nonce)
		currentNonce = nonce
		
		return request
	}
	
	func userAuth(authorization: ASAuthorization) {
		Auth.auth().signIn(with: getOAuthCredential(authorization: authorization)) { (authDataResult, error) in
			
			if let error = error {
				print(error.localizedDescription)
			}
			
			if let user = authDataResult?.user {
				SetRootViewController.saveCurrentScreen(currentScreen: .homeScreenViewController)
				ShowViewScreen.shared.showHomeScreen()
				print("Nice \(user.uid) email: \(String(describing: user.email))")
			}
		}
	}
	
	private func getOAuthCredential(authorization: ASAuthorization) -> OAuthCredential {
		guard let appleIDCrendential = authorization.credential as? ASAuthorizationAppleIDCredential,
			  let nonce = currentNonce,
			  let appleIDToken = appleIDCrendential.identityToken,
			  let idTokenString = String(data: appleIDToken, encoding: .utf8) else { return
				OAuthProvider.credential(withProviderID: "", idToken: "", rawNonce: "")
		}
		return OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
	}
	
	private func randomNonceString(length: Int = 32) -> String {
	  precondition(length > 0)
	  let charset: Array<Character> =
		  Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
	  var result = ""
	  var remainingLength = length

	  while remainingLength > 0 {
		let randoms: [UInt8] = (0 ..< 16).map { _ in
		  var random: UInt8 = 0
		  let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
		  if errorCode != errSecSuccess {
			fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
		  }
		  return random
		}

		randoms.forEach { random in
		  if remainingLength == 0 {
			return
		  }

		  if random < charset.count {
			result.append(charset[Int(random)])
			remainingLength -= 1
		  }
		}
	  }

	  return result
	}

	//MARK: - sha256
	@available(iOS 13, *)
	private func sha256(_ input: String) -> String {
	  let inputData = Data(input.utf8)
	  let hashedData = SHA256.hash(data: inputData)
	  let hashString = hashedData.compactMap {
		return String(format: "%02x", $0)
	  }.joined()

	  return hashString
	}
}
