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
	
	private func configureUI() {
		productImage.layer.cornerRadius = 6
		productSale.addAttributeString()
	}
	
}
