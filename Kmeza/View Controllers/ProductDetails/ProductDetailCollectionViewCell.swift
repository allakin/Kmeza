//
//  ProductDetailCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 17.01.2021.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var productImage: UIImageView!
	
	func configureContent(_ info: InformationOfProduct) {
		productImage.backgroundColor = .yellow
		info.productImages.forEach { productImage.image = UIImage(named: $0.image) }
	}
}
