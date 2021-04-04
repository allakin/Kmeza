//
//  DiscoverCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 12.01.2021.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productTitle: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var productSale: UILabel!
	@IBOutlet weak var typeCollection: UILabel!
	@IBOutlet weak var addToWishListButton: UIButton!
	
	var buttonTapAction: (()->())?
	var savedData = false
	
	private var isAddedToWishList = false
	
	var viewModel: DiscoverCellViewModelProtocol! {
		didSet {
			configureUI()
			
			productImage.image = UIImage(named: viewModel.image)
			productTitle.text = viewModel.title
			productPrice.text = viewModel.price
			productSale.text = viewModel.sale
			typeCollection.text = viewModel.collectionType
			
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
		productImage.layer.cornerRadius = 6
		productSale.addAttributeString()
	}
	
}
