//
//  DiscoverCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

import UIKit

class DiscoverCollectionViewController: UICollectionViewController {
	private var isAddedToWishList = false
	
	var viewModel: DiscoverViewModelProtocol! {
		didSet{
			viewModel.getData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = DiscoverViewModel()
	}
	
	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView,
								 numberOfItemsInSection section: Int) -> Int {
		viewModel.numberOfRows()
	}
	
	override func collectionView(_ collectionView: UICollectionView,
								 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
													  for: indexPath) as! DiscoverCollectionViewCell
		
		cell.viewModel = viewModel.cellViewModel(at: indexPath)
		cell.buttonTapAction = { cell.changeAddToWishListStatus()
//			let saveTest = Product(cover: "",
//								   typeCollection: "",
//								   productType: "",
//								   name: "viewModel.title",
//								   price: 0,
//								   sale: 0,
//								   numberStock: 0,
//								   numberOfProducts: 0,
//								   productInformation: InformationOfProduct(thumbnails: [ProductImage(image: "")],
//																			numberOfReviews: 0,
//																			description: "",
//																			colorPickers: [ColorPicker(red: 0.0,
//																									   green: 0.0,
//																									   blue: 0.0)],
//																			specification: Specification(brand: "",
//																										 weight: "",
//																										 condition: "",
//																										 category: "",
//																										 typeCloths: ""),
//																			sizes: [Size(size: "")]))
//
//				AddToWishlist.save(value: saveTest)
		}
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		performSegue(withIdentifier: "showDetail", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
			if let indexPath = collectionView.indexPathsForSelectedItems?.first {
				let detailsVC = segue.destination as? ProductDetailViewController
				let selectedProduct = viewModel.products[indexPath.item]
				detailsVC?.viewModel = ProductDetailViewModel(product: selectedProduct)
			}
		}
	}
}

extension DiscoverCollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
	}
}
