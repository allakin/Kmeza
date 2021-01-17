//
//  SideMenuTableViewCell.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 15.01.2021.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

	@IBOutlet weak var pageIcon: UIImageView!
	@IBOutlet weak var pageName: UILabel!
	@IBOutlet weak var pageSelection: UIView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		pageSelection.layer.cornerRadius = pageSelection.frame.width / 2
    }
	
	func configureContant(_ contant: SideMenuPage) {
		pageIcon.image = UIImage(named: contant.pageImage)
		pageName.text = contant.pageName
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
}
