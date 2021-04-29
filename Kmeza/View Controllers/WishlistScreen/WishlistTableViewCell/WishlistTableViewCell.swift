//
//  WishlistTableViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 28.03.2021.
//

import UIKit

class WishlistTableViewCell: UITableViewCell {
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productTitle: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var productSale: UILabel!
	@IBOutlet weak var productNumberOfReviews: UILabel!
	@IBOutlet weak var addToWishListButton: UIButton!
	
	var buttonTapAction: (()->())?
	
	var viewModel: WishlistTableViewCellViewModelProtocol! {
		didSet {
			productTitle.text = viewModel.title
			productImage.image = UIImage(named: viewModel.image)
			productSale.text = viewModel.sale
			productPrice.text = viewModel.price
			productNumberOfReviews.text = viewModel.numberOfReviews
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
		productSale.addAttributeString()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
