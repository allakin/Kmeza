//
//  WelcomeFeatureCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 29.12.2020.
//

import UIKit

class WelcomeFeatureCollectionViewController: UIViewController {
	
	@IBOutlet weak var welcomeCollectionView: UICollectionView!
	
	let information: [WelcomeFeature] = WelcomeFeature.collection
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
	}
	
	private func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		welcomeCollectionView.collectionViewLayout = layout
		welcomeCollectionView.delegate = self
		welcomeCollectionView.dataSource = self
		welcomeCollectionView.contentInsetAdjustmentBehavior = .never
		welcomeCollectionView.isPagingEnabled = true
	}
}

extension WelcomeFeatureCollectionViewController: UICollectionViewDelegate,
												  UICollectionViewDataSource,
									 UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		information.count
	}
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
													  for: indexPath) as! WelcomeFeatureCollectionViewCell
		let info = information[indexPath.item]
		cell.configureContant(with: info)
		cell.welcomePageController.currentPage = indexPath.item
		cell.titleLabel.text = info.title
		cell.descriptionLabel.text = info.description
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		let itemWidth = view.bounds.width
		let itemHeight = view.bounds.height
		
		return CGSize(width: itemWidth, height: itemHeight)
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		0
	}
	
}
