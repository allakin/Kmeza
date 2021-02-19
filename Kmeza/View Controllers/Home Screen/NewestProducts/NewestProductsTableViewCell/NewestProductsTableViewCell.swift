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
		if viewModel.isAddedToWishList.value {
			viewModel.changeAddToWishListStatus()
			addToWishListButton.setImage(UIImage(named: "AddToWishList"), for: .normal)
			print(false)
		} else {
			viewModel.changeAddToWishListStatus()
			addToWishListButton.setImage(UIImage(named: "AddToWishListPressed"), for: .normal)
			print(true)
		}
	}
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
