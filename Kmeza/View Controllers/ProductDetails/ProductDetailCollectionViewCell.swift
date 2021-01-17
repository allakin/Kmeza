//
//  ProductDetailCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 17.01.2021.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet var productColor: [UIButton]!
	@IBOutlet weak var pageControl: UIPageControl!
	
	func configureContent() {
		configureUI()
		
	}
	
	private func configureUI() {
		productColor.forEach { $0.layer.cornerRadius = $0.frame.size.width / 2 }
	}
}
