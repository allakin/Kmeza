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
