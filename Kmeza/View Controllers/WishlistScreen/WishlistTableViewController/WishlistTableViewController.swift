//
//  WishlistTableViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 28.03.2021.
//

import UIKit

class WishlistTableViewController: UITableViewController {
	
	var viewModel: WishlistTableViewControllerViewModelProtocol! {
		didSet {
			viewModel.getData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = WishlistTableViewControllerViewModel()
	}
	
	// MARK: - Table view data source
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.countOfProduct()
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WishlistTableViewCell

		cell.selectionStyle = .none
		cell.viewModel = viewModel.cellViewModel(at: indexPath)
		
		return cell
	}
	
	// TODO: - Сделать переход к экрану ProductDetailViewModel
//	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		if segue.identifier == "showDetail" {
//			if let indexPath = tableView.indexPathForSelectedRow {
//				let detailsVC = segue.destination as? ProductDetailViewController
//				let selectedProduct = wishlists[indexPath.row]
//				detailsVC?.viewModel = ProductDetailViewModel(product: selectedProduct)
//			}
//		}
//	}
	
}
