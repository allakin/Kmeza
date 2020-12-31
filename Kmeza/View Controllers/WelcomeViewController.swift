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
		LoginWithFacebookButton.settingButton(image: "Facebook")
		LoginWithAppleIDButton.settingButton(image: "Apple")
		LoginWithEmailButton.settingButton(image: "Email")
		LoginWithEmailButton.setLeftPositionIconInsideButton(at: 20)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
