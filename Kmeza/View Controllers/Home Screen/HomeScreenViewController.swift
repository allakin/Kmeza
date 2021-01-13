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
		print(FetchRootViewController.fetchData())
		newProductsCount.text = "Showing \(productsCount ?? "") Results"
    }
	
	func products(count: Int) {
		productsCount = "\(count)"
	}
	
	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "countOfProducts" {
			let destinationVC = segue.destination as! NewestProductsTableViewController
			destinationVC.delegate = self
		}
	}


}
