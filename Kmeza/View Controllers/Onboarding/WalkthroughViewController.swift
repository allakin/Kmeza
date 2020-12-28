//
//  WalkthroughViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 19.12.2020.
//

import UIKit

class WalkthroughViewController: UIViewController {
	@IBOutlet weak var collectionView: UICollectionView!
	
	let information: [WalkthroughInformation] = WalkthroughInformation.collection
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
	}
	
	private func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		collectionView.collectionViewLayout = layout
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.contentInsetAdjustmentBehavior = .never
		collectionView.isPagingEnabled = true
	}
	
	private func changeScreen(indexParh: IndexPath) {
		if indexParh.item == information.count - 1 {
			SaveDataInUserDefaults.saveData(state: true, key: WALKTHROUGH_VALUE)
			ShowWelcomeScreen.shared.showWelcomeScreen()
		} else {
			let index = indexParh.item + 1
			let nextIndexPath = IndexPath(item: index, section: 0)
			collectionView.scrollToItem(at: nextIndexPath, at: .right, animated: true)
		}
	}
}

extension WalkthroughViewController: UICollectionViewDelegate,
									 UICollectionViewDataSource,
									 UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		information.count
	}
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
													  for: indexPath) as! WalkthroughCollectionViewCell
		let info = information[indexPath.item]
		cell.configureContant(with: info)
		cell.walkthroughPageController.currentPage = indexPath.item
		cell.actionButtonDidTap = { self.changeScreen(indexParh: indexPath) }
		cell.changeNextButtonBGColor(number: information.count - 1)
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
	
}
