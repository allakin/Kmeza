//
//  HomeScreenViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 06.01.2021.
//

import UIKit
import SideMenu

class HomeScreenViewController: UIViewController, NewestProductsTableViewControllerDelegate {
	
	@IBOutlet weak var newProductsCount: UILabel!
	@IBOutlet weak var newestProductContainerView: UIView!
	
	var productsCount: String?
	private var sideMenu: SideMenuNavigationController?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		print(FetchRootViewController.fetchData())
		
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
		navigationController?.navigationBar.tintColor = UIColor(red:0.73, green:0.74, blue:0.83, alpha:1.00)
		
		settingSideMenu()
		newProductsCount.text = "Showing \(productsCount ?? "") Results"
	
		SaveCurrentPage.save(.home)
    }
	
	@IBAction func showSideMenuAction(_ sender: UIBarButtonItem) {
		present(sideMenu!, animated: true)
	}
	
	func products(count: Int) {
		productsCount = "\(count)"
	}
	
	@IBAction func showCatalogAction(_ sender: UIButton) {
		performSegue(withIdentifier: "showCatalog", sender: nil)
	}
	
	private func settingSideMenu() {
		let sideMenuVC = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(identifier: "SideMenuTableViewController")
		
		sideMenu = SideMenuNavigationController(rootViewController: sideMenuVC)
		sideMenu?.leftSide = true
		sideMenu?.setNavigationBarHidden(true, animated: false)
		sideMenu?.menuWidth = 262
		
		SideMenuManager.default.leftMenuNavigationController = sideMenu
		SideMenuManager.default.addPanGestureToPresent(toView: view)
	}
	
	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "countOfProducts" {
			let destinationVC = segue.destination as! NewestProductsTableViewController
			destinationVC.delegate = self
		}
	}
}
