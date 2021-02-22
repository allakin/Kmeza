//
//  FlashSaleCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

import UIKit

class FlashSaleCollectionViewController: UICollectionViewController {
	
	var viewModel: FlashSaleCollectionViewControllerViewModelProtocol! {
		didSet {
			viewModel.getData()
		}
	}
	
	private var isAddedToWishList = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = FlashSaleCollectionViewControllerViewModel()
	}
	
	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView,
								 numberOfItemsInSection section: Int) -> Int {
		viewModel.countOfProduct()
	}
	
	override func collectionView(_ collectionView: UICollectionView,
								 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
													  for: indexPath) as! FlashSaleCollectionViewCell
		
		cell.viewModel = viewModel.cellViewModel(at: indexPath)
		cell.buttonTapAction = { cell.changeAddToWishListStatus() }
		
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

extension FlashSaleCollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
	}
}
