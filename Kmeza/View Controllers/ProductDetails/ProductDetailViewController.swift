//
//  ProductDetailViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 17.01.2021.
//

import UIKit

class ProductDetailViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
		navigationController?.navigationBar.tintColor = .white
	}
	
	@IBAction func returnToHomeScreenAction(_ sender: Any) {
		dismiss(animated: true) {
			let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
			let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController")
			newViewController.modalPresentationStyle = .fullScreen
			self.present(newViewController, animated: true, completion: nil)
		}
	}
	
	
	deinit {
		print("\(ProductDetailViewController.self) deinit")
	}
}
