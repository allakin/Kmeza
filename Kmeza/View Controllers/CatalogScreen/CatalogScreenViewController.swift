//
//  CatalogScreenViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 24.01.2021.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class CatalogScreenViewController: UICollectionViewController {
	
	let categories = Category.categories
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureCollectionCell()
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		categories.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatalogScreenViewCell
		
		let category = categories[indexPath.item]
		cell.configureContent(category)
		
		return cell
	}
	
	private func configureCollectionCell() {
		// Create a waterfall layout
		let layout = CHTCollectionViewWaterfallLayout()
		
		// Change individual layout attributes for the spacing between cells
		layout.minimumColumnSpacing = 20
		layout.minimumInteritemSpacing = 20
		
		// Set the waterfall layout to your collection view
		collectionView.collectionViewLayout = layout
	}
}

extension CatalogScreenViewController: CHTCollectionViewDelegateWaterfallLayout {
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: categories[indexPath.item].width, height: categories[indexPath.item].height)
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						columnCountForSection section: Int) -> Int {
		2
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
	}
}
