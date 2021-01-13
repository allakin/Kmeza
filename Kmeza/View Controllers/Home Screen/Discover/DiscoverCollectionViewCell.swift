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
	@IBOutlet weak var addToWishListButton: UIButton!
	
	var buttonTapAction: (()->())?
    
	func configureContant(with info: DiscoverProduct) {
		configureUI()
		
		productImage.image = UIImage(named: info.image)
		productTitle.text = info.title
		productPrice.text = "$\(info.price)"
		productSale.text = "$\(info.sale)"
		
		addToWishListButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
	}
	
	@objc func tappedButton() {
		buttonTapAction?()
	}
	
	private func configureUI() {
		productImage.layer.cornerRadius = 6
		
		let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "Your Text")
			attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
		productSale.attributedText = attributeString
	}
	
}
