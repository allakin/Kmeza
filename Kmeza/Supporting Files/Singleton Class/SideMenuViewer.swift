//
//  SideMenuViewer.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 27.03.2021.
//

import SideMenu

class SideMenuViewer {
	static let shared = SideMenuViewer()
	private var sideMenu: SideMenuNavigationController?
	
	func showSideMenu() -> SideMenuNavigationController {
		let sideMenuVC = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(identifier: "SideMenuTableViewController")
		
		sideMenu = SideMenuNavigationController(rootViewController: sideMenuVC)
		
		settingSideMenu()
		
		return sideMenu!
	}
	
	private func settingSideMenu() {
		sideMenu?.leftSide = true
		sideMenu?.setNavigationBarHidden(true, animated: false)
		sideMenu?.menuWidth = 262
	}
}
