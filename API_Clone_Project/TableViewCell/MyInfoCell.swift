//
//  MyInfoCell.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/18.
//

import UIKit

class MyInfoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func myInfoSetUI() {
        nameLabel.text = ""
        idLabel.text = ""
        emailLabel.text = ""
        ageLabel.text = ""
        imageLabel.image = UIImage()
    }

}
