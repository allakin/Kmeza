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
	

    override func awakeFromNib() {
        super.awakeFromNib()
		let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "Your Text")
			attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
		productSale.attributedText = attributeString
		
		productImage.layer.cornerRadius = 8
		
		addToWishListButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
	}
	
	@objc func tappedButton() {
		buttonTapAction?()
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
