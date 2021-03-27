//
//  HomeScreenViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 06.01.2021.
//

import UIKit

class HomeScreenViewController: UIViewController, NewestProductsTableViewControllerDelegate {
	
	@IBOutlet weak var newProductsCount: UILabel!
	@IBOutlet weak var newestProductContainerView: UIView!
	
	var productsCount: String?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.settingUI()
		newProductsCount.text = "Showing \(productsCount ?? "") Results"
		SaveCurrentPage.save(.home)
    }
	
	@IBAction func showSideMenuAction(_ sender: UIBarButtonItem) {
		present(SideMenuViewer.shared.showSideMenu(), animated: true)
	}
	
	func products(count: Int) {
		 productsCount = "\(count)"
	 }
	
	deinit {
		print(HomeScreenViewController.self)
	}
	
	@IBAction func showCatalogAction(_ sender: UIButton) {
		performSegue(withIdentifier: "showCatalog", sender: nil)
	}
	
	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "countOfProducts" {
			let destinationVC = segue.destination as! NewestProductsTableViewController
			destinationVC.delegate = self
		}
	}
}
