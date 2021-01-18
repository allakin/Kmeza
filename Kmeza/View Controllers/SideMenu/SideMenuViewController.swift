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
		
		userEmail.text = GetUserInformation.shared.getUserEmail()
		userName.text = GetUserInformation.shared.getUserName()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		pages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = sideMenu.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuTableViewCell
		
		let page = pages[indexPath.row]
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
			destination(view: "HomeScreenViewController")
		default:
			break
		}
	}
	
	private func destination(view: String) {
		dismiss(animated: true) {
			let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
			let newViewController = storyBoard.instantiateViewController(withIdentifier: view)
			newViewController.modalPresentationStyle = .fullScreen
			self.present(newViewController, animated: true, completion: nil)
		}
	}
}
