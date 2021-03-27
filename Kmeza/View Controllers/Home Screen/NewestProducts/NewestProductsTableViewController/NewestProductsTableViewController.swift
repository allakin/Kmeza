//
//  NewestProductsTableViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 11.01.2021.
//

import UIKit

protocol NewestProductsTableViewControllerDelegate {
	func products(count: Int)
}

class NewestProductsTableViewController: UITableViewController {
	
	var viewModel: NewestProductsViewModelProtocol! {
		didSet {
			viewModel.getData()
		}
	}
	
	var delegate: NewestProductsTableViewControllerDelegate!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = NewestProductsViewModel()
		delegate.products(count: viewModel.countOfProduct())
	}

	// MARK: - Table view data source
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.countOfProduct()
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewestProductsTableViewCell
		
		cell.selectionStyle = .none
		cell.viewModel = viewModel.cellViewModel(at: indexPath)
		cell.buttonTapAction = { cell.changeAddToWishListStatus() }
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: "showDetail", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
			if let indexPath = tableView.indexPathForSelectedRow {
				let detailsVC = segue.destination as? ProductDetailViewController
				let selectedProduct = viewModel.products[indexPath.row]
				detailsVC?.viewModel = ProductDetailViewModel(product: selectedProduct)
			}
		}
	}
}
