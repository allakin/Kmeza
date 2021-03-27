//
//  CatalogCollectionViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 08.03.2021.
//

import UIKit

class CatalogCollectionViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	
	var viewModel: CatalogCollectionViewModelProtocol! {
		didSet {
			viewModel.getData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
		navigationController?.navigationBar.tintColor = UIColor(red:0.73, green:0.74, blue:0.83, alpha:1.00)
		
		let image = UIImage(named: "Menu")
		let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showSideMenu))
		navigationItem.leftBarButtonItem = button
		
		viewModel = CatalogCollectionViewModel()
		
		setupCollectionView()
		
		SaveCurrentPage.save(.catalog)
	}
	
	@objc func showSideMenu() {
		present(SideMenuViewer.shared.showSideMenu(), animated: true)
	}
	
	private func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		collectionView.collectionViewLayout = layout
		collectionView.contentInsetAdjustmentBehavior = .never
		collectionView.isPagingEnabled = true
	}
}

// MARK: UICollectionViewDataSource
extension CatalogCollectionViewController: UICollectionViewDelegate,
									 UICollectionViewDataSource,
									 UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
								 numberOfItemsInSection section: Int) -> Int {
		viewModel.numberOfRows()
	}

	func collectionView(_ collectionView: UICollectionView,
								 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
													  for: indexPath) as! CatalogCollectionViewCell
	
		cell.viewModal = viewModel.cellViewModel(at: indexPath)
	
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		let itemWidth = collectionView.bounds.width
		let itemHeight = collectionView.bounds.height
		
		return CGSize(width: itemWidth, height: itemHeight)
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		0
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		performSegue(withIdentifier: "showCollection", sender: nil)
	}
}
