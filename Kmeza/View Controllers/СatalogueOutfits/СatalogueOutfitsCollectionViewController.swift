//
//  СatalogueOutfitsCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 24.01.2021.
//

import UIKit
import CHTCollectionViewWaterfallLayout
import SideMenu


class СatalogueOutfitsCollectionViewController: UICollectionViewController {
	
	let categories = Category.categories
	private var sideMenu: SideMenuNavigationController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureCollectionCell()
		
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
		navigationController?.navigationBar.tintColor = UIColor(red:0.73, green:0.74, blue:0.83, alpha:1.00)
		
		let image = UIImage(named: "Menu")
		let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(cancel))
		navigationItem.leftBarButtonItem = button
		
		settingSideMenu()
		
		SaveCurrentPage.save(.catalog)
	}
	
	override func collectionView(_ collectionView: UICollectionView,
								 numberOfItemsInSection section: Int) -> Int {
		categories.count
	}
	
	override func collectionView(_ collectionView: UICollectionView,
								 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
													  for: indexPath) as! СatalogueOutfitsCell
		
		let category = categories[indexPath.item]
		cell.configureContent(category)
		
		return cell
	}
	
	@objc func cancel() {
//		dismiss(animated: true) {
//			self.present(self.sideMenu!, animated: true)
//		}
		present(sideMenu!, animated: true)
	}
	
	deinit {
		print(СatalogueOutfitsCollectionViewController.self)
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
	
	private func settingSideMenu() {
		let sideMenuVC = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(identifier: "SideMenuTableViewController")
		
		sideMenu = SideMenuNavigationController(rootViewController: sideMenuVC)
		sideMenu?.leftSide = true
		sideMenu?.setNavigationBarHidden(true, animated: false)
		sideMenu?.menuWidth = 262
		
//		SideMenuManager.default.leftMenuNavigationController = sideMenu
//		SideMenuManager.default.addPanGestureToPresent(toView: view)
	}
}

extension СatalogueOutfitsCollectionViewController: CHTCollectionViewDelegateWaterfallLayout {
	
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
		UIEdgeInsets(top: 28, left: 28, bottom: 0, right: 28)
	}
}
