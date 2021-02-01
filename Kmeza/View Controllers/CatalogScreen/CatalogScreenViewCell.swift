//
//  CatalogScreenViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 31.01.2021.
//

import UIKit

class CatalogScreenViewCell: UICollectionViewCell {
	@IBOutlet weak var catalogImage: UIImageView!
	@IBOutlet weak var catalogTitle: UILabel!
	@IBOutlet weak var countOfProducts: UILabel!
	
	func configureContent(_ data: Category) {
		settingUI()
		
		catalogTitle.text = data.title
		countOfProducts.text = "\(data.countlOfProduct) Products"
	}
	
	private func settingUI() {
		catalogImage.layer.cornerRadius = 8
	}
}
