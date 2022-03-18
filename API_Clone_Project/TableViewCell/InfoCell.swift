//
//  InfoCell.swift
//  API_Clone_Project
//
//  Created by 백래훈 on 2022/03/18.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var listNameLabel: UILabel!
    
    @IBOutlet weak var listImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func infoSetUI() {
        listNameLabel.text = ""
        listImage.image = UIImage()
    }
}
