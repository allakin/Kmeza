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
		viewModel = CatalogCollectionViewModel()
		setupCollectionView()
    }
	
	private func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		collectionView.collectionViewLayout = layout
		collectionView.contentInsetAdjustmentBehavior = .never
		collectionView.isPagingEnabled = true
	}
}

extension CatalogCollectionViewController: UICollectionViewDelegate,
									 UICollectionViewDataSource,
									 UICollectionViewDelegateFlowLayout {
	// MARK: UICollectionViewDataSource
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
	
//	func collectionView(_ collectionView: UICollectionView,
//						layout collectionViewLayout: UICollectionViewLayout,
//						insetForSectionAt section: Int) -> UIEdgeInsets {
//		UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
//	}
	
}
