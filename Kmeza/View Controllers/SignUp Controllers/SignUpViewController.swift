//
//  SignUpViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 31.12.2020.
//

import UIKit
import AuthenticationServices
import FirebaseAuth

class SignUpViewController: UIViewController {
	
	@IBOutlet weak var scrollView: UIScrollView!
	
	@IBOutlet weak var emailTextField: TextFieldWithPadding!
	@IBOutlet weak var passwordTextField: TextFieldWithPadding!
	@IBOutlet weak var passwordAgainTextField: TextFieldWithPadding!
	
	@IBOutlet weak var registerButton: UIButton!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var appleIDLoginButton: UIButton!
	
	private var similarPassword = ""
	private var similarPasswordAgain = ""
	
	private let showPasswordButton: UIButton = {
		let button = UIButton()
		button.tag = 0
		button.setImage(UIImage(named: "passwordHide"), for: .normal)
		button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
		return button
	}()
	
	private let showPasswordAgainButton: UIButton = {
		let button = UIButton()
		button.tag = 1
		button.setImage(UIImage(named: "passwordHide"), for: .normal)
		button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
		return button
	}()
	
	//MARK: - ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		settingButtons()
		settingUITextField()
		addShowButtonToTextField()
		hideKeyboardWhenTappedAround()
		
		emailTextField.addTarget(self, action: #selector(validateEmail), for: .editingChanged)
		passwordTextField.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
		passwordAgainTextField.addTarget(self, action: #selector(validatePasswordAgain), for: .editingChanged)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
	}
	
	@IBAction func PressButton(_ sender: UIButton) {
		switch sender.tag {
		case 0:
			correctPassword()
		case 1:
			print("123123")
		default:
			getPerformRequests()
			settingActivityIndicatorInButton(button: appleIDLoginButton)
			setAlphaChanel(buttons: [loginButton, registerButton])
			setAlphaChanel(texFields: [emailTextField, passwordTextField, passwordAgainTextField])
		}
	}
	
	private func getPerformRequests() {
		let request = SignWithAppleID.shared.createAppleIDRequest()
		let autorizationController = ASAuthorizationController(authorizationRequests: [request])
		
		autorizationController.delegate = self
		autorizationController.presentationContextProvider = self
		
		autorizationController.performRequests()
	}
}

//MARK: - ASAuthorizationControllerDelegate
extension SignUpViewController: ASAuthorizationControllerDelegate {
	func authorizationController(controller: ASAuthorizationController,
								 didCompleteWithAuthorization authorization: ASAuthorization) {
		
		SignWithAppleID.shared.userAuth(authorization: authorization)
	}
}

//MARK: - ASAuthorizationControllerPresentationContextProviding
extension SignUpViewController: ASAuthorizationControllerPresentationContextProviding {
	func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
		view.window!
	}
}

//MARK: - Setting UI
extension SignUpViewController {
	private func settingButtons() {
		registerButton.setFullRoundCorners()
		registerButton.setButtonShadow()
		
		loginButton.setFullRoundCorners()
		loginButton.addBorderButton()
		
		appleIDLoginButton.settingButton(image: "Apple")
		appleIDLoginButton.setLeftPositionIconInsideButton(at: 20)
	}
	
	private func settingUITextField() {
		emailTextField.defaultStateTextField()
		passwordTextField.defaultStateTextField()
		passwordAgainTextField.defaultStateTextField()
		
		passwordTextField.textInsets.right = 60
		passwordAgainTextField.textInsets.right = 60
		
		emailTextField.delegate = self
		passwordTextField.delegate = self
		passwordAgainTextField.delegate = self
	}
	
	private func settingActivityIndicatorInButton(button: UIButton) {
		AddActivityIndicator.shared.startActivityIndicator()
		button.addActivityIndicatorInsideButton(at: view)
		button.changeAlphaChanel()
	}
	
	private func setAlphaChanel(buttons: [UIButton]) {
		buttons.forEach { $0.changeAlphaChanel() }
	}
	
	private func setAlphaChanel(texFields: [UITextField]) {
		texFields.forEach { $0.isEnabled = false }
	}
	
	private func addShowButtonToTextField() {
		passwordTextField.rightView = showPasswordButton
		passwordAgainTextField.rightView = showPasswordAgainButton
		
		passwordTextField.rightViewMode = .always
		passwordAgainTextField.rightViewMode = .always
	}
}

//MARK: - Logic with Keyboard
extension SignUpViewController {
	@objc func keyboardWillShow(notification: NSNotification) {
		guard let userInfo = notification.userInfo else { return }
		guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
		let keyboardFrame = keyboardSize.cgRectValue
		scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrame.height)
	}
	
	@objc func keyboardWillHide(notification: NSNotification) {
		scrollView.contentOffset = CGPoint.zero
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	private func hideKeyboardWhenTappedAround() {
		let tap = UITapGestureRecognizer(target: self,
										 action: #selector(dismissKeyboard))
		view.addGestureRecognizer(tap)
	}
	
}

//MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate  {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == emailTextField {
			passwordTextField.becomeFirstResponder()
		} else if textField == passwordTextField {
			passwordAgainTextField.becomeFirstResponder()
		} else {
			correctPassword()
			view.endEditing(true)
		}
		return true
	}
}

//MARK: - Logic with Password
extension SignUpViewController {
	@objc func showPassword(sender: UIButton) {
		switch sender.tag {
		case 0:
			isShowPassword(textField: passwordTextField, and: showPasswordButton)
		default:
			isShowPassword(textField: passwordAgainTextField, and: showPasswordAgainButton)
		}
	}
	
	private func isShowPassword(textField: UITextField, and button: UIButton) {
		if textField.isSecureTextEntry {
			textField.isSecureTextEntry.toggle()
			button.setImage(UIImage(named: "passwordShow"), for: .normal)
		} else {
			textField.isSecureTextEntry.toggle()
			button.setImage(UIImage(named: "passwordHide"), for: .normal)
		}
	}
	
	private func correctPassword() {
		if similarPassword == similarPasswordAgain {
			settingActivityIndicatorInButton(button: registerButton)
			setAlphaChanel(buttons: [loginButton, appleIDLoginButton])
			setAlphaChanel(texFields: [emailTextField, passwordTextField, passwordAgainTextField])
		} else {
			passwordTextField.errorStateTextField()
			passwordAgainTextField.errorStateTextField()
		}
		
		if passwordTextField.isSecureTextEntry {
			passwordTextField.isSecureTextEntry.toggle()
			showPasswordButton.setImage(UIImage(named: "passwordShow"), for: .normal)
		}
		
		if passwordAgainTextField.isSecureTextEntry {
			passwordAgainTextField.isSecureTextEntry.toggle()
			showPasswordAgainButton.setImage(UIImage(named: "passwordShow"), for: .normal)
		}
	}
}

//MARK: - Validation Text Fields
extension SignUpViewController {
	@objc func validateEmail() {
		isValid(textField: emailTextField, type: .email)
		isEmpty(textField: emailTextField)
	}
	
	@objc func validatePassword() {
		isValid(textField: passwordTextField, type: .password)
		similarPassword = passwordTextField.text ?? ""
		isEmpty(textField: passwordTextField)
	}
	
	@objc func validatePasswordAgain() {
		isValid(textField: passwordAgainTextField, type: .password)
		similarPasswordAgain = passwordAgainTextField.text ?? ""
		isEmpty(textField: passwordAgainTextField)
	}
	
	private func isValid(textField: UITextField, type: ValidityType) {
		
		guard let value = textField.text else { return }
		
		if textField.isValid(value: value, with: type) {
			textField.filledStateTextField()
		} else {
			textField.fillingStateTextField()
		}
	}
	
	private func isEmpty(textField: UITextField) {
		if textField.text == "" {
			textField.defaultStateTextField()
		}
	}
}
