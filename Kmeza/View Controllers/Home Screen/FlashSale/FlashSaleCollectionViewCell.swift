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
	
	func configureContant(product: FlashSaleProduct) {
		configureUI()
		
		productImage.image = UIImage(named: product.image)
		productTitle.text = product.title
		productPrice.text = "$\(product.price)"
		numberStockProducts.text = "\(product.numberStock) Left"
		leftStockProducts.progress = configureProgressView(number: product.numberStock)
		
		addToWishListButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
	}
	
	@objc func tappedButton() {
		buttonTapAction?()
	}
	
	private func configureUI() {
		productImage.layer.cornerRadius = 8
	}
	
	private func configureProgressView(number: Int) -> Float {
		let test = 200 - number
		let test2 = Float(Double(test) / 200)
		return test2
	}
}
