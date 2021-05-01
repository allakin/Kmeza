//
//  WishlistCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 01.05.2021.
//

import UIKit

class WishlistCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.delegate = self
		collectionView.dataSource = self
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		wishlists.count
	}
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
													  for: indexPath) as! WishlistCollectionViewCell
		let wishlist = wishlists[indexPath.item]
		cell.productTitle.text = wishlist.name
		cell.productImage.image = UIImage(named: wishlist.cover)
		
		return cell
	}
}

extension WishlistCollectionViewController:
									 UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		28
	}

	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		28
	}
}
