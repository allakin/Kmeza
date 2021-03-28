//
//  WishlistViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 28.03.2021.
//

import UIKit

class WishlistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.settingUI()
		SaveCurrentPage.save(.wishlist)
    }
	
	@IBAction func showSideMenuAction(_ sender: UIBarButtonItem) {
		present(SideMenuViewer.shared.showSideMenu(), animated: true)
	}
}
