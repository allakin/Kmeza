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
		numberStockProducts.text = configureLeftCountProducts(product.numberStock,
															  product.numberOfProducts.number)
		leftStockProducts.progress = configureProgressView(number: product.numberStock,
														   product.numberOfProducts.number)
		
		addToWishListButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
	}
	
	@objc func tappedButton() {
		buttonTapAction?()
	}
	
	private func configureUI() {
		productImage.layer.cornerRadius = 8
	}
	
	private func configureLeftCountProducts(_ number: Int, _ count: Int) -> String {
		var result = ""
		
		if number > count {
			result = "0 Left"
		} else {
			result = "\(number) Left"
		}
		
		return result
	}
	
	private func configureProgressView(number: Int, _ count: Int) -> Float {
		var result: Float = 0
		
		if number <= count {
			let leftProduct = Float(Double(count - number) / Double(count))
			result += leftProduct
		} else {
			result += 1
		}
		
		return result
	}
}
