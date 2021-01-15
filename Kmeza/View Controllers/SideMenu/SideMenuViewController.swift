//
//  SideMenuViewController.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 14.01.2021.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var userName: UILabel!
	@IBOutlet weak var userEmail: UILabel!
	
	@IBOutlet weak var sideMenu: UITableView!
	
	private let pages = SideMenuPage.page
	
	override func viewDidLoad() {
		super.viewDidLoad()
		userImage.roundingImage()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		pages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = sideMenu.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuTableViewCell
		
		let page = pages[indexPath.row]
		cell.configureContant(page)
		
		let currentPage = FetchCurrentPage.fetch()
		
		if page.pageName == currentPage {
			cell.pageSelection.isHidden = false
			cell.pageName.textColor = .white
			cell.pageIcon.image = UIImage(named: "\(currentPage)Pressed")
		}
		
		
		return cell
	}
}
