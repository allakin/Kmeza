//
//  WishlistViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 28.03.2021.
//

import UIKit

class WishlistViewController: UIViewController {
	@IBOutlet weak var cellProductView: UIView!
	@IBOutlet weak var listProductView: UIView!
	
	@IBOutlet weak var listProductViewButton: UIBarButtonItem!
	@IBOutlet weak var cellProductViewButton: UIBarButtonItem!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.settingUI()
		SaveCurrentPage.save(.wishlist)
		listProductViewButton.tintColor = UIColor.getColor(color: .primaryAccentColor)
	}
	
	@IBAction func showSideMenuAction(_ sender: UIBarButtonItem) {
		present(SideMenuViewer.shared.showSideMenu(), animated: true)
	}
	
	@IBAction func changeListViewAction(_ sender: UIBarButtonItem) {
		switch sender.tag {
		case 0:
			listProductView.isHidden = false
			listProductViewButton.tintColor = UIColor.getColor(color: .primaryAccentColor)
			
			cellProductView.isHidden = true
			cellProductViewButton.tintColor = UIColor.getColor(color: .navigationButtonColor)
		default:
			listProductView.isHidden = true
			listProductViewButton.tintColor = UIColor.getColor(color: .navigationButtonColor)
			
			cellProductView.isHidden = false
			cellProductViewButton.tintColor = UIColor.getColor(color: .primaryAccentColor)
		}
	}
}
