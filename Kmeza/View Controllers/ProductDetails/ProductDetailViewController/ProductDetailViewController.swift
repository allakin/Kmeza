//
//  ProductDetailViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 17.01.2021.
//

import UIKit

class ProductDetailViewController: UIViewController {
	
	@IBOutlet var productColor: [UIButton]!
	@IBOutlet var sizeButton: [UIButton]!
	
	@IBOutlet weak var productName: UILabel!
	@IBOutlet weak var collectionType: UILabel!
	@IBOutlet weak var numberOfReviews: UILabel!
	@IBOutlet weak var brandName: UILabel!
	@IBOutlet weak var productWeight: UILabel!
	@IBOutlet weak var conditionType: UILabel!
	@IBOutlet weak var categoryType: UILabel!
	@IBOutlet weak var typeCloths: UILabel!
	@IBOutlet weak var productDescription: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var productSale: UILabel!
	
	@IBOutlet weak var buyButton: UIButton!
	@IBOutlet weak var addToWishlistButton: UIButton!
	
	var viewModel: ProductDetailViewModelProtocol!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		settingUI()
		configureContant()
		SettingProductDetailButton.shared.setDisabledState(at: buyButton, and: viewModel.price)
		SettingProductDetailButton.shared.hideLabel(at: productSale, and: viewModel.price)
	}
	
	@IBAction func productSizeAction(_ sender: UIButton) {
		SettingProductDetailButton.shared.setSelectedSize(at: sizeButton, and: sender.tag)
//		SettingProductDetailButton.shared.isDisableSizeButton(at: sizeButton, name: sender.currentTitle ?? "")
	}
	
	@IBAction func productColorAction(_ sender: UIButton) {
		SettingProductDetailButton.shared.setSelectedColor(at: productColor, and: sender.tag)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showProductImages" {
			let destination = segue.destination as! ProductThumbnailsCollectionViewController
			let images = ProductThumbnailsCollectionViewViewModal(productImages: viewModel.productInformation.thumbnails)
			destination.viewModel = images
		}
	}
	
	deinit {
		print("\(ProductDetailViewController.self) deinit")
	}
	
	private func configureContant() {
		productName.text = viewModel.name
		collectionType.text = viewModel.collectionType
		numberOfReviews.text = viewModel.numberOfReviews
		brandName.text = viewModel.brandName
		productWeight.text = viewModel.productWeight
		conditionType.text = viewModel.conditionType
		categoryType.text = viewModel.categoryType
		typeCloths.text = viewModel.typeCloths
		productDescription.text = viewModel.description
		productPrice.text = viewModel.price
		productSale.text = viewModel.sale
	}
	
	private func settingUI() {		
		productSale.addAttributeString()
		
		buyButton.setFullRoundCorners()
		addToWishlistButton.setFullRoundCorners()
		addToWishlistButton.setButtonShadow()
		
		sizeButton.forEach { $0.addBorderButton(); $0.setFullRoundCorners() }
		
		productColor.forEach { $0.layer.cornerRadius = $0.frame.size.width / 2 }
		
		for index in zip(productColor, viewModel.productInformation.colorPickers) {
			index.0.backgroundColor = UIColor(red: CGFloat(index.1.red),
											  green: CGFloat(index.1.green),
											  blue: CGFloat(index.1.blue),
											  alpha: 1)
		}
		
		for index in zip(sizeButton, viewModel.productInformation.sizes) {
			if index.0.currentTitle != index.1.size || viewModel.price == "SOLD" {
				index.0.isEnabled = false
				index.0.layer.borderWidth = 1
				index.0.layer.borderColor = UIColor.lightGray.cgColor
				index.0.setTitleColor(.lightGray, for: .disabled)
			}
		}
	}
}
