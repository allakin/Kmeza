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

	let products = Product.products
	var delegate: NewestProductsTableViewControllerDelegate!
	
	private var newestProducts: [Product] = []
	private var isAddedToWishList = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
		sortProducts(by: .newestProducts)
		delegate.products(count: newestProducts.count)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		newestProducts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewestProductsTableViewCell
		
		let product = newestProducts[indexPath.row]
		cell.productImage.image = UIImage(named: product.cover)
		cell.productTitle.text = product.title
		cell.productPrice.text = "$\(product.price)"
		cell.productSale.text = "$\(product.sale)"
		cell.productNumberOfReviews.text = "(\(product.productInformation.numberOfReviews) Reviews)"
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
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
			if let indexPath = tableView.indexPathForSelectedRow {
				let detailsVC = segue.destination as? ProductDetailViewController
//				detailsVC?.product = newestProducts[indexPath.row]
			}
		}
	}
	
	private func sortProducts(by type: ProductType) {
		products.forEach { (product) in
			if product.productType == type.rawValue {
				let product = Product(cover: product.cover,
									  typeCollection: product.typeCollection,
									  productType: product.productType,
									  title: product.title,
									  price: product.price,
									  sale: product.sale,
									  numberStock: product.numberStock,
									  numberOfProducts: product.numberOfProducts,
									  productInformation: product.productInformation)
				newestProducts.append(product)
			}
		}
	}
}
