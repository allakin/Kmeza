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
		setDisabledState()
	}
	
	@IBAction func productSizeAction(_ sender: UIButton) {
		setSelectedSize(at: sender.tag)
	}
	
	@IBAction func productColorAction(_ sender: UIButton) {
		setSelectedColor(at: sender.tag)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showProductImages" {
			let destination = segue.destination as! ProductDetailCollectionViewController
			destination.viewModel = ProductDetailCollectionViewModal(productImages: viewModel.productInformation.productImages)
		}
	}
	
	deinit {
		print("\(ProductDetailViewController.self) deinit")
	}
	
	private func setSelectedSize(at tag: Int) {
		for (index, value) in sizeButton.enumerated() {
			if index == tag {
				value.backgroundColor = UIColor.getColor(color: .primaryAccentColor)
			} else {
				value.backgroundColor = .clear
			}
		}
	}
	
	private func setSelectedColor(at tag: Int) {
		for (index, value) in productColor.enumerated() {
			if index == tag {
				value.layer.borderWidth = 2
				value.layer.borderColor = UIColor.getColor(color: .primaryAccentColor).cgColor
			} else {
				value.layer.borderWidth = 0
			}
		}
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
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
		navigationController?.navigationBar.tintColor = .white
		
		productSale.addAttributeString()
		
		buyButton.setFullRoundCorners()
		addToWishlistButton.setFullRoundCorners()
		addToWishlistButton.setButtonShadow()
		
		sizeButton.forEach { $0.addBorderButton(); $0.setFullRoundCorners() }
		
		productColor.forEach { $0.layer.cornerRadius = $0.frame.size.width / 2 }
		
		for index in zip(productColor, viewModel.productInformation.color) {
			index.0.backgroundColor = UIColor(red: CGFloat(index.1.red),
											  green: CGFloat(index.1.green),
											  blue: CGFloat(index.1.blue),
											  alpha: 1)
		}
	}
	
	private func setDisabledState() {
		if productPrice.text == "SOLD" {
			buyButton.isSelected = false
			buyButton.backgroundColor = .lightGray
			buyButton.titleColor(for: .disabled)
			productSale.isHidden = true
		}
	}
}
