//
//  FlashSaleCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productTitle: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var numberStockProducts: UILabel!
	@IBOutlet weak var leftStockProducts: UIProgressView!
	@IBOutlet weak var addToWishListButton: UIButton!
	
	var buttonTapAction: (()->())?
	private var isAddedToWishList = false
	
	var viewModel: FlashSaleCollectionCellViewModelProtocol! {
		didSet {
			configureUI()
			
			productImage.image = UIImage(named: viewModel.image)
			productTitle.text = viewModel.title
			productPrice.text = viewModel.price
			numberStockProducts.text = viewModel.numberStockProducts
			leftStockProducts.progress = viewModel.leftStockProducts
			
			addToWishListButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
		}
	}
	
	@objc func tappedButton() {
		buttonTapAction?()
	}
	
	func changeAddToWishListStatus() {
		viewModel.isAddedToWishList.bind { [unowned self] isAddedToWishList in
			self.isAddedToWishList = isAddedToWishList
		}

		addToWishListButton.setImage(changeImageForAddwishListButton(value: isAddedToWishList),
									 for: .normal)

		viewModel.changeAddToWishListStatus()
	}
	
	private func changeImageForAddwishListButton(value: Bool) -> UIImage {
		UIImage(named: value ? "AddToWishList_White" : "AddToWishListPressed_White")!
	}
	
	private func configureUI() {
		productImage.layer.cornerRadius = 8
	}
}
