//
//  WelcomeViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 19.12.2020.
//

import UIKit

class WelcomeViewController: UIViewController {
	@IBOutlet weak var LoginWithEmailButton: UIButton!
	@IBOutlet weak var LoginWithAppleIDButton: UIButton!
	@IBOutlet weak var LoginWithFacebookButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		settingUI()
    }
	
	private func settingUI() {
		LoginWithFacebookButton.settingButton(image: "Facebook")
		LoginWithAppleIDButton.settingButton(image: "Apple")
		LoginWithEmailButton.settingButton(image: "Email")
		LoginWithEmailButton.setLeftPositionIconInsideButton(at: 20)
	}
}
