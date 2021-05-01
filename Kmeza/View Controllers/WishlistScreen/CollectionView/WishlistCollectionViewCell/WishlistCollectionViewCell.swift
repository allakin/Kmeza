//
//  WishlistCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 01.05.2021.
//

import UIKit

class WishlistCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productTitle: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var productSale: UILabel!
	@IBOutlet weak var productNumberOfReviews: UILabel!
	@IBOutlet weak var addToWishListButton: UIButton!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		productSale.addAttributeString()
	}
}
