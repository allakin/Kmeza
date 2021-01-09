//
//  SignInViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 08.01.2021.
//

import UIKit

class SignInViewController: UIViewController {
	@IBOutlet weak var scrollView: UIScrollView!
	
	@IBOutlet weak var emailTextField: TextFieldWithPadding!
	@IBOutlet weak var passwordTextField: TextFieldWithPadding!
	
	@IBOutlet weak var logInButton: UIButton!
	@IBOutlet weak var registerButton: UIButton!
	@IBOutlet weak var appleIDLoginButton: UIButton!
	
	private let showPasswordButton: UIButton = {
		let button = UIButton()
		button.tag = 0
		button.setImage(UIImage(named: "passwordHide"), for: .normal)
		button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
		return button
	}()
	
	private var isFilledEmail = false
	private var isFilledPassword = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		settingUI()
		hideKeyboardWhenTappedAround()
		
		emailTextField.addTarget(self, action: #selector(validateEmail), for: .editingChanged)
		passwordTextField.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
	}
	
	@IBAction func logInAction(_ sender: UIButton) {
		correctPassword()
	}
	
	@IBAction func appleIDLoginAction(_ sender: UIButton) {
	}
	
	@IBAction func resetPasswordAction(_ sender: UIButton) {
	}
	
	private func signIn() {
		guard let email = emailTextField.text,
			  let password = passwordTextField.text else { return }
		SignIn.shared.signIn(email: email, password: password)
	}
	
}

//MARK: - Setting UI
extension SignInViewController {
	@objc func showPassword() {
		isShowPassword(textField: passwordTextField, and: showPasswordButton)
	}
	
	private func settingUI() {
		emailTextField.defaultStateTextField()
		passwordTextField.defaultStateTextField()
		
		passwordTextField.textInsets.right = 60
		passwordTextField.rightView = showPasswordButton
		passwordTextField.rightViewMode = .always
		
		emailTextField.delegate = self
		passwordTextField.delegate = self
		
		logInButton.setFullRoundCorners()
		logInButton.setButtonShadow()
		
		registerButton.setFullRoundCorners()
		registerButton.addBorderButton()
		
		appleIDLoginButton.settingButton(image: "Apple")
		appleIDLoginButton.setLeftPositionIconInsideButton(at: 20)
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
		if isFilledEmail && isFilledPassword {
			settingActivityIndicatorInButton(button: logInButton)
			setAlphaChanel(texFields: [emailTextField, passwordTextField])
			setAlphaChanel(buttons: [logInButton, registerButton, appleIDLoginButton])
			signIn()
		} else if !isFilledEmail {
			emailTextField.errorStateTextField()
		} else if !isFilledPassword {
			passwordTextField.errorStateTextField()
		}
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
}

//MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate  {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == emailTextField {
			passwordTextField.becomeFirstResponder()
		} else {
			correctPassword()
			view.endEditing(true)
		}
		return true
	}
}

//MARK: - Logic with Keyboard
extension SignInViewController {
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

//MARK: - Validation Text Fields
extension SignInViewController {
	@objc func validateEmail() {
		guard let email = emailTextField.text else { return }
		
		let isValidEmail = email.isValidPassword()
		
		if isValidEmail {
			isFilledEmail = true
			emailTextField.filledStateTextField()
		} else {
			emailTextField.fillingStateTextField()
		}
		
		isEmpty(textField: emailTextField)
	}
	
	@objc func validatePassword() {
		guard let password = passwordTextField.text else { return }
		
		let isValidPassword = password.isValidPassword()
		
		if isValidPassword {
			isFilledPassword = true
			passwordTextField.filledStateTextField()
		} else {
			passwordTextField.fillingStateTextField()
		}
		
		isEmpty(textField: passwordTextField)
	}
	
	private func isEmpty(textField: UITextField) {
		if textField.text == "" {
			textField.defaultStateTextField()
		}
	}
}
