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
	
	private var items = SideMenuItem.items
	
	override func viewDidLoad() {
		super.viewDidLoad()
		userImage.roundingImage()
		
		userEmail.text = GetUserInformation.shared.getUserEmail()
		userName.text = GetUserInformation.shared.getUserName()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = sideMenu.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuTableViewCell
		
		let page = items[indexPath.row]
		cell.configureContant(page)
		cell.selectionStyle = .none
		
		let currentPage = FetchCurrentPage.fetch()
		
		if page.pageName == currentPage {
			cell.pageSelection.isHidden = false
			cell.pageName.textColor = .white
			cell.pageIcon.image = UIImage(named: "\(currentPage)Pressed")
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch indexPath.row {
		case 0:
			FetchCurrentPage.fetch() == CurrentPage.home.rawValue ? dismiss(animated: true, completion: nil) : test2()
		case 1:
			FetchCurrentPage.fetch() == CurrentPage.catalog.rawValue ? dismiss(animated: true, completion: nil) : test()
		default:
			break
		}
	}
	
	deinit {
		print(SideMenuViewController.self)
	}
	
	func test() {
		let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CatalogScreenViewController")
		viewController?.modalPresentationStyle = .fullScreen
		present(viewController!, animated: true, completion: nil)
	}
	
	func test2() {
		let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController")
		viewController?.modalPresentationStyle = .fullScreen
		present(viewController!, animated: true, completion: nil)
	}
	
}
