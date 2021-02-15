//
//  ProductDetailCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 17.01.2021.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var productImage: UIImageView!
	
	var viewModel: ProductDetailCollectionCellViewModelProtocol! {
		didSet {
			productImage.backgroundColor = .yellow
			viewModel.getImages().forEach { (image) in
				productImage.image = UIImage(named: image)
			}
		}
	}
}
