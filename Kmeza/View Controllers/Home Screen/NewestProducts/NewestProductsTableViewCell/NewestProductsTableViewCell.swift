//
//  NewestProductsTableViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 11.01.2021.
//

import UIKit

class NewestProductsTableViewCell: UITableViewCell {
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productTitle: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var productSale: UILabel!
	@IBOutlet weak var productNumberOfReviews: UILabel!
	@IBOutlet weak var addToWishListButton: UIButton!
	
	var buttonTapAction: (()->())?
	private var isAddedToWishList = false
	
	var viewModel: NewestProductsTableCellViewModelProtocol! {
		didSet {
			productImage.image = UIImage(named: viewModel.image)
			productTitle.text = viewModel.title
			productPrice.text = viewModel.price
			productSale.text = viewModel.sale
			productNumberOfReviews.text = viewModel.numberOfReviews
			addToWishListButton.setImage(UIImage(named: "AddToWishList"), for: .normal)
		}
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		productSale.addAttributeString()
		productImage.layer.cornerRadius = 8

		addToWishListButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
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
		UIImage(named: value ? "AddToWishList" : "AddToWishListPressed")!
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
}
