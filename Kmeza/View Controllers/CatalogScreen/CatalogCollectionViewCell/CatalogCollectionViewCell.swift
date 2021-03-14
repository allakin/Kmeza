//
//  CatalogCollectionViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 08.03.2021.
//

import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var catalogImage: UIImageView!
	@IBOutlet weak var catalogTitle: UILabel!
	@IBOutlet weak var catalogButton: UIButton!
	@IBOutlet weak var nextPage: UILabel!
	@IBOutlet weak var previewsPage: UILabel!
	
	var viewModal: CatalogCollectionCellViewModelProtocol! {
		didSet {
			settingUI()
			
			catalogImage.image = UIImage(named: viewModal.catalogImage)
			catalogTitle.text = viewModal.catalogTitle
			nextPage.text = viewModal.nextPage
			previewsPage.text = viewModal.previewsPage
		}
	}
	
	private func settingUI() {
		catalogImage.layer.cornerRadius = 20
		
		catalogButton.setFullRoundCorners()
		catalogButton.setButtonShadow()
	}
}
