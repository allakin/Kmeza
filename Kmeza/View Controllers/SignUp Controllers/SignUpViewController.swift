//
//  SignUpViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 31.12.2020.
//

import UIKit

class SignUpViewController: UIViewController {
	
	@IBOutlet weak var scrollView: UIScrollView!
	
	@IBOutlet weak var emailTextField: TextFieldWithPadding!
	@IBOutlet weak var passwordTextField: TextFieldWithPadding!
	@IBOutlet weak var passwordAgainTextField: TextFieldWithPadding!
	
	@IBOutlet weak var registerButton: UIButton!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var appleIDLoginButton: UIButton!
	@IBOutlet weak var facebookLoginButton: UIButton!
	
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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		settingButtons()
		settingUITextField()
		addShowButtonToTextField()
		hideKeyboardWhenTappedAround()
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	@IBAction func PressButton(_ sender: UIButton) {
		switch sender.tag {
		case 0:
			settingActivityIndicatorInButton(button: registerButton)
			setAlphaChanel(buttons: [loginButton, appleIDLoginButton, facebookLoginButton])
			setAlphaChanel(texFields: [emailTextField, passwordTextField, passwordAgainTextField])
		case 1:
			print("123123")
		case 2:
			settingActivityIndicatorInButton(button: appleIDLoginButton)
			setAlphaChanel(buttons: [loginButton, registerButton, facebookLoginButton])
			setAlphaChanel(texFields: [emailTextField, passwordTextField, passwordAgainTextField])
		default:
			settingActivityIndicatorInButton(button: facebookLoginButton)
			setAlphaChanel(buttons: [loginButton, appleIDLoginButton, registerButton])
			setAlphaChanel(texFields: [emailTextField, passwordTextField, passwordAgainTextField])
		}
	}
	
	@objc func keyboardWillShow(notification: NSNotification) {
		guard let userInfo = notification.userInfo else { return }
		guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
		let keyboardFrame = keyboardSize.cgRectValue
		scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrame.height)
	}
	
	@objc func keyboardWillHide(notification: NSNotification) {
		scrollView.contentOffset = CGPoint.zero
	}
	
	@objc func showPassword(sender: UIButton) {
		switch sender.tag {
		case 0:
			isShowPassword(textField: passwordTextField, and: showPasswordButton)
		default:
			isShowPassword(textField: passwordAgainTextField, and: showPasswordAgainButton)
		}
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	private func hideKeyboardWhenTappedAround() {
		let tap = UITapGestureRecognizer(target: self,
										 action: #selector(dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
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
	
	private func addShowButtonToTextField() {
		passwordTextField.rightView = showPasswordButton
		passwordAgainTextField.rightView = showPasswordAgainButton
		
		passwordTextField.rightViewMode = .always
		passwordAgainTextField.rightViewMode = .always
	}
	
	private func settingButtons() {
		registerButton.setFullRoundCorners()
		registerButton.setButtonShadow()
		
		loginButton.setFullRoundCorners()
		loginButton.addBorderButton()
		
		appleIDLoginButton.settingButton(image: "Apple")
		
		facebookLoginButton.settingButton(image: "Facebook")
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
}


extension SignUpViewController: UITextFieldDelegate  {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == emailTextField {
			passwordTextField.becomeFirstResponder()
		} else if textField == passwordTextField {
			passwordAgainTextField.becomeFirstResponder()
		} else {
			view.endEditing(true)
			//			settingActivityIndicatorInButton(button: registerButton)
			//			setAlphaChanel(buttons: [loginButton, appleIDLoginButton, facebookLoginButton])
			//			setAlphaChanel(texFields: [emailTextField, passwordTextField, passwordAgainTextField])
		}
		return true
	}
}
