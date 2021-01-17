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

	let products = NewestProduct.newestProducts
	var delegate: NewestProductsTableViewControllerDelegate!
	private var isAddedToWishList = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
		delegate.products(count: products.count)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewestProductsTableViewCell
		
		let product = products[indexPath.row]
		cell.productImage.image = UIImage(named: product.cover)
		cell.productTitle.text = product.title
		cell.productPrice.text = "$\(product.price)"
		cell.productSale.text = "$\(product.sale)"
		cell.productNumberOfReviews.text = "(\(product.numberOfReviews) Reviews)"
		cell.selectionStyle = .none
		
		cell.buttonTapAction = { () in
			if self.isAddedToWishList {
				self.isAddedToWishList.toggle()
				cell.addToWishListButton.setImage(UIImage(named: "AddToWishList"), for: .normal)
			} else {
				self.isAddedToWishList.toggle()
				cell.addToWishListButton.setImage(UIImage(named: "AddToWishListPressed"), for: .normal)
			}
		}
		
        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: "showDetail", sender: nil)
	}
	
}
