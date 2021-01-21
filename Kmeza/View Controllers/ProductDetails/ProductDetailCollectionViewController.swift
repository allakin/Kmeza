//
//  ProductDetailCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 17.01.2021.
//

import UIKit

class ProductDetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	var images: InformationOfProduct!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		images.productImages.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductDetailCollectionViewCell
		
		cell.configureContent(images)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		let itemWidth = view.bounds.width
		let itemHeight = view.bounds.height
		
		return CGSize(width: itemWidth, height: itemHeight)
	}
}
