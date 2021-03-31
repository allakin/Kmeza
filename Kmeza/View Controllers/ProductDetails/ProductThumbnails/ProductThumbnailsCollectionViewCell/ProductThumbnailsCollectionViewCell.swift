//
//  ProductThumbnailsCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 17.01.2021.
//

import UIKit

class ProductThumbnailsCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var productImage: UIImageView!
	
	var viewModel: ProductThumbnailsCollectionViewCellViewModalProtocol! {
		didSet {
			productImage.backgroundColor = .yellow
			viewModel.getImages().forEach { (image) in
				productImage.image = UIImage(named: image)
			}
		}
	}
}
